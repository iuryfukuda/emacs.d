(use-package helm
  :ensure t
  :bind
  ("M-x" . helm-M-x)
  ("M-y" . helm-show-kill-ring)
  ("C-x b" . helm-mini)
  ("C-x C-f" . helm-find-files)
  (:map helm-map
        ("C-h" . delete-backward-char))
  :config
  (helm-mode 1)
  (helm-autoresize-mode t)
  ;; enable fuzzy match
  (setq
   ;; helm-M-x => M-x
   helm-M-x-fuzzy-match t
   ;; helm-mini => C-x b
   helm-buffers-fuzzy-matching t
   helm-recentf-fuzzy-match t)

  ;; helm-ff-do-grep ack-grep
  (when (executable-find "ack-grep")
    (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
          helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f")))
