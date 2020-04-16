;; copy to X clipboard
(defun copy-to-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (message "Yanked region to x-clipboard!")
        (call-interactively 'clipboard-kill-ring-save))
    (if (region-active-p)
        (progn
          (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
          (message "Yanked region to clipboard!")
          (deactivate-mark))
      (message "No region active; can't yank to clipboard!"))))

;; paste from x clipboard
(defun paste-from-clipboard ()
  (interactive)
  (if (display-graphic-p)
      (progn
        (clipboard-yank)
        (message "graphics active"))
    (insert (shell-command-to-string "xsel -o -b"))))

(defun kill-to-clipboard  ()
  "Run `some-command' and `some-other-command' in sequence."
  (interactive)
  (when (and(use-region-p) (not (display-graphic-p)))
    (copy-to-clipboard)
    (kill-region 0 0 t)))
