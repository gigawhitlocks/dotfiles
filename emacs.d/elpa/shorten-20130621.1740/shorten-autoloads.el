;;; shorten-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (shorten-strings) "shorten" "shorten.el" (21039
;;;;;;  40084 857670 915000))
;;; Generated autoloads from shorten.el

(autoload 'shorten-strings "shorten" "\
Takes a list of strings and returns an alist ((STRING
. SHORTENED-STRING) ...).  Uses `shorten-split-function' to split
the strings, and `shorten-join-function' to join shortened
components back together into SHORTENED-STRING.  See also
`shorten-validate-component-function'.

\(fn STRINGS)" nil nil)

;;;***

;;;### (autoloads nil nil ("shorten-pkg.el") (21039 40084 947147
;;;;;;  207000))

;;;***

(provide 'shorten-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; shorten-autoloads.el ends here
