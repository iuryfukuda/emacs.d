(use-package ace-window
  :ensure t
  :requires (transpose-frame)
  :bind
  ("M-o" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-background nil))

(use-package transpose-frame
  :ensure t)
