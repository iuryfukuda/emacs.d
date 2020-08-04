(use-package flyspell
  :ensure t
  :config
  (setq ispell-program-name "hunspell"))
;;  :bind ("C-ç f" . flyspell-mode))
  ;; ("C-x c f" . flyspell-mode))
  ;; (:map flyspell-mode-map
  ;;       ("C-x c c" . ispell-word)
  ;;       ("C-x c r" . flyspell-region)
  ;;       ("C-x c b" . flyspell-buffer)
  ;;       ("C-x c e" . flyspell-to-english)
  ;;       ("C-x c p" . flyspell-to-portuguese)))

(defun flyspell-to-portuguese()
  (interactive)
  (ispell-change-dictionary "pt_BR"))

(defun flyspell-to-english()
  (interactive)
  (ispell-change-dictionary "en_US"))
