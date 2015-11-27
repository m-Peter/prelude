(setq default-frame-alist '((font . "Monospace-16")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

(server-start)

(require 'fill-column-indicator)

(setq fci-rule-column 80)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'ruby-mode-hook 'robe-mode)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)

(blink-cursor-mode -1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(global-linum-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " Prelude - " (:eval (if (buffer-file-name)
                                                    (abbreviate-file-name (buffer-file-name))
                                                  "%b"))))

(require 'smart-mode-line)
(setq sml/theme 'dark)

(sml/setup)

;; enable monokai theme
(load-theme 'monokai t)

;; disable scroll bar
(scroll-bar-mode -1)

;;; personal-ui.el ends here.
