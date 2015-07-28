;;; personal-clojure.el --- Personal settings for Clojure files.

;;; Code:

(add-hook 'clojure-mode-hook 'fci-mode)

(defun nrepl-connection-for-buffer (buffer)
  "Returns either the corresponding nrepl buffer for the given buffer, or a string error message."
  (if (not (cider-connected-p))
      "No active nREPL connection."
    (let ((project-directory (nrepl-project-directory-for (nrepl-current-dir))))
      (if project-directory
          (let ((buf (car (-filter
                           (lambda (conn)
                             (let ((conn-proj-dir (with-current-buffer (get-buffer conn)
                                                    nrepl-project-dir)))
                               (when conn-proj-dir
                                 (equal (file-truename project-directory)
                                        (file-truename conn-proj-dir)))))
                           nrepl-connection-list))))
            (if buf
                (get-buffer buf)
              "No relevant nREPL connection found."))
        "No project directory found."))))

(defun cider-reset ()
  (interactive)
  (save-buffer)
  (set-buffer (nrepl-connection-for-buffer (current-buffer)))
  (goto-char (point-max))
  (insert "(user/reset)")
  (cider-repl-return))

(add-hook 'clojure-mode-hook
  (lambda () (define-key prelude-mode-map (kbd "C-c r") 'cider-reset)))

;;; personal-clojure.el ends here
