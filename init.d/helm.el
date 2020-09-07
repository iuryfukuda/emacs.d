(use-package helm
  :ensure t
  :bind
  ("<f1> SPC" . helm-all-mark-rings)
  ("C-c h" . helm-command-prefix)
  ("M-x" . helm-M-x)
  ("M-y" . helm-show-kill-ring)
  ("C-x b" . helm-mini)
  ("C-x C-f" . helm-find-files)
  (:map helm-map
        ("C-h" . delete-backward-char))
  (:map helm-command-map
        ("o" . helm-occur)
        ("g" . helm-google-suggest))
  :config
  (helm-mode 1)
  (helm-autoresize-mode t)
  ;; enable fuzzy match
  (setq
   ;; helm-M-x => M-x
   helm-M-x-fuzzy-match t
   ;; helm-mini => C-x b
   helm-buffers-fuzzy-matching t
   helm-recentf-fuzzy-match t
   ;; helm-semantic-or-imenu => C-c h i
   helm-semantic-fuzzy-match t
   helm-imenu-fuzzy-match t
   ;; helm-locate => C-c h l
   helm-locate-fuzzy-match t
   ;; helm-apropos => C-c h a
   helm-apropos-fuzzy-match t
   ;; helm-lisp => C-c h <tab>
   helm-lisp-fuzzy-completion t)
  
  ;; helm-ff-do-grep ack-grep
  (when (executable-find "ack-grep")
    (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
          helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

  ;; helm-man-woman => C-c h m
  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages))
