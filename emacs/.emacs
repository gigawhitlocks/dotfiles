;; sets up marmalade and melpa for package goodness
(add-to-list 'load-path "~/.emacs.d/")
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)


;; installs use-package if not available
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

;; mouse
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq muse-sel-mode t)


;; install some packages
(use-package jedi
  :ensure jedi)
(use-package python
  :ensure python)
(use-package flycheck
  :ensure flycheck)
(use-package auto-complete
  :ensure auto-complete)
(use-package magit
  :ensure magit)


;; enables evil-mode everywhere by default
(use-package evil
	     :init (evil-mode 1)
	     :ensure evil)

;; kj to exit insert mode in evil-mode
(define-key evil-insert-state-map "k" #'cofi/maybe-exit)
(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "k")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
	       nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
    (delete-char -1)
    (set-buffer-modified-p modified)
    (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
			  (list evt))))))))
;; make the GUI better
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; font

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

; ido-mode
(require 'ido)
(ido-mode t)

(defun whitespace-cleanup* ()
  (let* ((modified-before-p (buffer-modified-p)))
    (whitespace-cleanup)
    (if (not modified-before-p)
	(not-modified))))

(defun whitespace-cleanup-on-save ()
  (add-hook 'write-contents-hooks #'whitespace-cleanup*))

(add-hook 'python-mode-hook     #'whitespace-cleanup-on-save)


;; virtualenv stuff
(use-package virtualenvwrapper
  :ensure virtualenvwrapper)
(venv-initialize-eshell)

; jedi (autocomplete) for python
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'linum-mode)
(setq jedi:complete-on-dot t)

(use-package autopair
  :ensure autopair
  :init (autopair-global-mode))

; tab width for python
(add-hook 'python-mode-hook 'setq tab-width 4)



;; makes sure the mouse is enabled in emacsclient
(defun enable-mouse ()
  (unless window-system
    (require 'mouse)
    (xterm-mouse-mode t)
    (global-set-key [mouse-4] '(lambda ()
				 (interactive)
				 (scroll-down 1)))
    (global-set-key [mouse-5] '(lambda ()
				 (interactive) 
				 (scroll-up 1)))
    (defun track-mouse (e))
    (setq mouse-sel-mode t)))

(add-hook 'server-switch-hook 'enable-mouse)
(add-hook 'server-visit-hook 'enable-mouse)
(enable-mouse)

;; exits minibuffer when you click away
(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)
