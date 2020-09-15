;; Automatic windows are always created on the bottom, not on the side.
(setq
 split-height-threshold 0
 split-width-threshold nil)

(use-package windmove
  :ensure t
  :bind
  ("M-o b" . windmove-left)
  ("M-o f" . windmove-right)
  ("M-o p" . windmove-up)
  ("M-o n" . windmove-down)
  ("M-o M-b" . windmove-left)
  ("M-o M-f" . windmove-right)
  ("M-o M-p" . windmove-up)
  ("M-o M-n" . windmove-down)
  ("M-o C-b" . windmove-left)
  ("M-o C-f" . windmove-right)
  ("M-o C-p" . windmove-up)
  ("M-o C-n" . windmove-down))

(use-package ace-window
  :ensure t
  :requires (transpose-frame)
  :bind
  ("M-o a" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-background nil))

(use-package transpose-frame
  :ensure t)
