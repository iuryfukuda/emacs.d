(use-package org
  :ensure t
  :config
  (setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))
  (require 'ox-md)
  (setq org-export-backends '(org ascii html icalendar latex md odt)))

