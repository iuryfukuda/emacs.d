(use-package yaml-mode
  :ensure t)

(use-package yaml-imenu
  :ensure t
  :requires yaml-mode
  :config
  (yaml-imenu-enable))
