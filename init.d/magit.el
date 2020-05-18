(use-package magit
  :ensure t
  :bind
  ("C-M-g" . magit-dispatch)
  :config
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t))
