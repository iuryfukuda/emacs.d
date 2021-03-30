;; (use-package wakatime-mode
;;   :ensure t
;;   :config
;;   (global-wakatime-mode))

;; 224b0929-4c31-4449-b57b-34b60efe3bd6

;;; Code:
(use-package wakatime-mode
  :ensure t
  :if (executable-find "wakatime")
  :defer 4
  :config
  (progn
    (setq wakatime-cli-path (executable-find "wakatime"))
    (global-wakatime-mode 1)))
