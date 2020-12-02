(defun magit-kill-buffers ()
  "Restore window configuration and kill all Magit buffers."
  (interactive)
  (let ((buffers (magit-mode-get-buffers)))
    (magit-restore-window-configuration)
    (mapc #'kill-buffer buffers)))

(use-package magit
  :ensure t
  :bind
  ("C-M-g" . magit-dispatch)
  ("C-x g" . magit-status)
  (:map magit-status-mode-map
	("q" . magit-kill-buffers))
  :config
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t)
  (setq magit-branch-read-upstream-first 'fallback))
