;;; personal-ruby.el --- Personal settings for Ruby files.

;;; Code:

;; Require extra ruby packages
(prelude-require-packages '(flymake-ruby))
(prelude-require-packages '(rbenv))
(prelude-require-packages '(robe))

(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'robe-mode)

;; Sane indentation
(setq ruby-deep-indent-paren nil)

;; Ruby shell binding
(define-key prelude-mode-map (kbd "C-c R r") 'inf-ruby)

;; Activate corresponding Ruby
(define-key prelude-mode-map (kbd "C-c R a") 'rbenv-use-corresponding)

;; Robe auto-triggers rbenv-use-corresponding
(defadvice inf-ruby-console-auto (before activate-rbenv-for-robe activate)
  (rbenv-use-corresponding))

(push 'company-robe company-backends)

(provide 'personal-ruby)
;;; personal-ruby.el ends here
