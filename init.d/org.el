;; Intialize orgmode
(use-package org
  :ensure t
  :after (ox-gfm ox-md org-bullets)
  :config
  (setq
   org-startup-indented t
   org-catch-invisible-edits 'error
   org-cycle-separator-lines -1
   calendar-week-start-day 1
   ;; org-ellipsis "⤵"
   org-use-speed-commands t
   org-refile-targets (quote ((nil :maxlevel . 9)
                              (org-agenda-files :maxlevel . 9)))
   org-src-tab-acts-natively t
   org-src-preserve-indentation t
   org-src-fontify-natively t
   org-directory (expand-file-name "Org" user-emacs-directory)
   org-agenda-files (expand-file-name "agenda" org-directory)
   org-support-shift-select t
   org-latex-packages-alist '(("margin=2cm" "geometry" nil)))
  (setq org-export-backends'(org ascii html icalendar latex md odt))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)))
  (require 'org-tempo))

;; github flavored markdown
(use-package ox-gfm
  :ensure t
  :after flyspell)

;; org-mode bullet list
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
