;; basic setup
(setq version-control t
      delete-old-versions t
      backup-by-copying t
      kept-new-versions 6
      kept-old-versions 2)

;; backup versioned files
(setq vc-make-backup-files t)

;; define backup location
(setq backup-directory (expand-file-name "backup" user-emacs-directory))

;; Default and per-save backups go here
(setq backup-directory-alist `(("" . ,backup-directory)))
