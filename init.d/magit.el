(use-package magit
  :ensure t
  :bind
  ("C-M-g" . magit-dispatch)
  :config
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t))

(defun magit-kill-buffers ()
  "Restore window configuration and kill all Magit buffers."
  (interactive)
  (let ((buffers (magit-mode-get-buffers)))
    (magit-restore-window-configuration)
    (mapc #'kill-buffer buffers)))

(bind-key "q" #'magit-kill-buffers magit-status-mode-map)
