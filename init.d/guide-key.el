(use-package guide-key
  ;;
  ;; Pop-up with possible keybinding completions
  ;;
  :defer 10
  :ensure t
  :diminish guide-key-mode
  :commands guide-key-mode
  :config
  (setq guide-key/idle-delay 2)
  (setq guide-key/guide-key-sequence t)
  (setq guide-key/popup-window-position 'bottom)
  (guide-key-mode 1)
  (guide-key/key-chord-hack-on))
