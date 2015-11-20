;;; personal-init.el --- Custom emacs configuration

;;; Code:

;; Enable caching
(setq projectile-enable-caching t)

;; Swap super with meta (useful on  OS X)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Disable magit setup instructions
(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'personal-init)
;;; personal-init.el ends here
