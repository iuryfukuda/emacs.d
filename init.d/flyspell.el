(use-package flyspell
  :ensure t
  :bind
  ("<f9>" . flyspell-mode)
  (:map flyspell-mode-map
        ("C-ç c" . ispell-word)
        ("C-ç r" . flyspell-region)
        ("C-ç e" . flyspell-to-english)
        ("C-ç p" . flyspell-to-portuguese))
  :config
  (setq ispell-program-name "hunspell"))

(defun flyspell-to-portuguese()
  (interactive)
  (ispell-change-dictionary "pt_BR"))

(defun flyspell-to-english()
  (interactive)
  (ispell-change-dictionary "en_US"))
