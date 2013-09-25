;; -*- mode: elisp -*-
;; sets up marmalade and melpa for package goodness
(add-to-list 'load-path "~/.emacs.d/")
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; enables evil-mode everywhere by default
(evil-mode 1)

;; make the GUI better
(setq inhibit-startup-message t)
(tool-bar-mode -1) 
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; font
(set-face-attribute 'default nil :font "Monaco-9")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8c6671c213b4c0bea1011de6f1a34fe6fb65fba28916c8d161fc79e68365e2bf" default)))
 '(erc-hide-timestamps t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'base16-default)
(add-hook 'erc-mode (lambda () 
		      (visual-line-mode t)
		      (setq erc-hide-list '("JOIN" "PART" "QUIT"))
		      (setq erc-auto-query 'frame))) 

; this shit doesnt work


(defun urgent-hint ()
  (let ((wm-hints (append (x-window-property "WM_HINTS" nil "WM_HINTS" nil nil t) nil)))
    (setcar wm-hints (logior (car wm-hints) #x00000100))
    (x-change-window-property "WM_HINTS" wm-hints nil "WM_HINTS" 32 t)))


; the following is sauron hints

(require 'sauron)
(setq sauron-separate-frame nil
      sauron-modules '(sauron-erc sauron-notifications sauron-dbus)
      sauron-max-line-length nil
      sauron-nick-insensitivity 15)

(setq sauron-event-added-functions
      '(urgent-hint))



(global-set-key
 (kbd "<f5>")
 'sauron-toggle-hide-show)

(sauron-start-hidden)

; the following colors nicks in ERC

(defmacro unpack-color (color red green blue &rest body)
  `(let ((,red   (car ,color))
         (,green (car (cdr ,color)))
         (,blue  (car (cdr (cdr ,color)))))
     ,@body))

(defun rgb-to-html (color)
  (unpack-color color red green blue
   (concat "#" (format "%02x%02x%02x" red green blue))))

(defun hexcolor-luminance (color)
  (unpack-color color red green blue
   (floor (+ (* 0.299 red) (* 0.587 green) (* 0.114 blue)))))

(defun invert-color (color)
  (unpack-color color red green blue
   `(,(- 255 red) ,(- 255 green) ,(- 255 blue))))

(defun erc-get-color-for-nick (nick dark)
  (let* ((hash     (md5 (downcase nick)))
         (red      (mod (string-to-number (substring hash 0 10) 16) 256))
         (blue     (mod (string-to-number (substring hash 10 20) 16) 256))
         (green    (mod (string-to-number (substring hash 20 30) 16) 256))
         (color    `(,red ,green ,blue)))
    (rgb-to-html (if (if dark (> (hexcolor-luminance color) 85)
                       (< (hexcolor-luminance color) 170))
                     (invert-color color)
                   color))))

(defun erc-highlight-nicknames ()
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\\w+" nil t)
      (let* ((bounds (bounds-of-thing-at-point 'word))
             (nick   (buffer-substring-no-properties (car bounds) (cdr bounds))))
        (when (erc-get-server-user nick)
	  (put-text-property
           (car bounds) (cdr bounds) 'face
           (cons 'foreground-color (erc-get-color-for-nick nick 't))))))))

(add-hook 'erc-insert-modify-hook 'erc-highlight-nicknames)
; end ERC colors

; ido-mode
(require 'ido)
(ido-mode t)


; jedi (autocomplete) for python
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

; tab width for python
(add-hook 'python-mode-hook 'setq tab-width 4)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

; flycheck mode
;(add-hook 'after-init-hook #'global-flycheck-mode)


(provide 'emacs)
