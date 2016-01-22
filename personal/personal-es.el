;;; personal-es.el --- Personal settings for Elasticsearch query files (.es)

;;; Code:

;; Require es-mode
(prelude-require-packages '(es-mode))

;; Open files with .es extension using es mode
(add-to-list 'load-path "/path/to/es-mode-dir")
(autoload 'es-mode "es-mode.el"
  "Major mode for editing Elasticsearch queries" t)
(add-to-list 'auto-mode-alist '("\\.es$" . es-mode))

(provide 'personal-es)
;;; personal-es.el ends here
