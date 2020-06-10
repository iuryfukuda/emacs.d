;; github flavored markdown
(use-package ox-gfm
  :ensure t)

;; intialize orgmode
(use-package org
  :ensure t
  :requires (ox-gfm flyspell)
  :init
  (setf (nth 4 org-emphasis-regexp-components) 10)
  (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
  :config
  (setq org-latex-packages-alist '(("margin=2cm" "geometry" nil)))
  (require 'ox-md)
  (setq org-export-backends '(org ascii html icalendar latex md odt)))

;; Correct text
(use-package flyspell
  :ensure t
  :bind
  ("C-ç f" . flyspell-mode)
  (:map flyspell-mode-map
        ("C-ç c" . ispell-word)
        ("C-ç r" . flyspell-region)
        ("C-ç b" . flyspell-buffer)
        ("C-ç e" . flyspell-to-english)
        ("C-ç p" . flyspell-to-portuguese))
  :config
  (setq ispell-program-name "hunspell")
  (defun flyspell-to-portuguese()
    (interactive)
    (ispell-change-dictionary "pt_BR"))
  (defun flyspell-to-english()
    (interactive)
    (ispell-change-dictionary "en_US")))





