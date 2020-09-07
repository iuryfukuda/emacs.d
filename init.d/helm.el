(use-package helm
  :ensure t
  :bind
  ("M-x" . helm-M-x)
  ("M-y" . helm-show-kill-ring)
  ("C-x b" . helm-mini)
  ("C-x C-f" . helm-find-files)
  (:map helm-map

        ("C-h" . delete-backwarid-char))
  :config
  (helm-mode 1)
  (helm-autoresize-mode t)
  ;; enable fuzzy match
  (setq
   ;; helm-M-x => M-x
   helm-M-x-fuzzy-match t
   ;; helm-mini => C-x b
   helm-buffers-fuzzy-matching t
   helm-recentf-fuzzy-match t))
