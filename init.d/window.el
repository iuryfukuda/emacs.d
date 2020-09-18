;; Automatic windows are always created on the bottom, not on the side.
(setq
 split-height-threshold 0
 split-width-threshold nil)

(use-package windmove
  :ensure t
  :bind
  ("M-O b" . windmove-left)
  ("M-O f" . windmove-right)
  ("M-O p" . windmove-up)
  ("M-O n" . windmove-down)
  ("M-O M-b" . windmove-left)
  ("M-O M-f" . windmove-right)
  ("M-O M-p" . windmove-up)
  ("M-O M-n" . windmove-down)
  ("M-O C-b" . windmove-left)
  ("M-O C-f" . windmove-right)
  ("M-O C-p" . windmove-up)
  ("M-O C-n" . windmove-down))

(use-package ace-window
  :ensure t
  :bind
  ("M-o" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-background nil))

(use-package transpose-frame
  :ensure t)
