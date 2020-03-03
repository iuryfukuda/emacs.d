(use-package go-complete
  :ensure t
  )

(use-package go-mode
  :ensure t
  :requires go-complete
  :config
  (defun go-mode-setup ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    (setq gofmt-command "goimports"))
  (add-hook 'completion-at-point-functions 'go-complete-at-point)
  (add-hook 'go-mode-hook 'go-mode-setup)
  :bind (("M-." . godef-jump)
	 ("C-c d" . godoc-at-point)))
