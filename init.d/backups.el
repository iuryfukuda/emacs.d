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
(setq backup-directory-session (expand-file-name "session" backup-directory))

;; Default and per-save backups go here
(setq backup-directory-alist `(("" . ,backup-directory)))

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist `(("" . ,backup-directory-session)))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)
