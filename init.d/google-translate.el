(use-package google-translate
  :ensure t
  :bind
  ("C-c t" . google-translate-at-point)
  ("C-c T" . google-translate-smooth-translate)
  :init
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "pt")
  (require 'google-translate-smooth-ui)
  (setq google-translate-translation-directions-alist
      '(("en" . "pt") ("pt" . "en"))))
