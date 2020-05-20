(use-package terraform-mode
  :bind (:map terraform-mode-map
	      ("C-c d" . terraform-doc-at-point))
  :ensure t)

(use-package terraform-doc
  :ensure t)
