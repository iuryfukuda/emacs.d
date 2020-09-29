(use-package haskell-mode
  :ensure t
  :config
  (add-hook 'haskell-mode-hook #'hindent-mode)
  (eval-after-load 'haskell-mode
          '(define-key haskell-mode-map [f8] 'haskell-navigate-imports)))

(use-package hindent
  :ensure t)
