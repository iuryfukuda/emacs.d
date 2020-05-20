(use-package go-complete
  :ensure t)

(use-package go-rename
  :ensure t)

;; Required install goimports
;; golang.org/x/tools/cmd/goimports
(defun go-mode-setup ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq gofmt-command "goimports"))

(use-package go-mode
  :ensure t
  :requires (go-complete go-rename)
  :bind (:map go-mode-map
              ("M-." . godef-jump)
	      ("C-c d" . godoc-at-point))
  :config
  (add-hook 'completion-at-point-functions 'go-complete-at-point)
  (add-hook 'go-mode-hook 'go-mode-setup))


