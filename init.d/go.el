(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :config
  (defun go-mode-setup ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    (setq gofmt-command "goimports"))
  (add-hook 'go-mode-hook 'go-mode-setup)
  :bind (("M-." . godef-jump)
	 ("C-c d" . godoc-at-point)))
