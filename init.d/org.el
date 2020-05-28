;; github flavored markdown
(use-package ox-gfm
  :ensure t)

;; intialize orgmode
(use-package org
  :ensure t
  :requires ox-gfm
  :config
  (setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))
  (require 'ox-md)
  (setq org-export-backends '(org ascii html icalendar latex md odt)))

