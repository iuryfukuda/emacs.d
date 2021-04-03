(use-package helm
  :ensure t
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("C-x f" . helm-find-files)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
	 :map helm-map
         ("C-h" . backward-delete-char))
  :config
  (helm-mode 1)
  (add-to-list 'display-buffer-alist
               `("*.*Helm.*"
                 (display-buffer-in-side-window)
                 (inhibit-same-window . t)
                 (side . bottom)
                 (window-height . 0.3))))

;; (setq helm-projectile-fuzzy-match nil)
(use-package helm-projectile :ensure t
  :config
  (helm-projectile-on)
  (setq helm-projectile-fuzzy-match t))

(use-package helm-ag :ensure t
  :custom
  '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
  '(helm-ag-command-option "--all-text")
  '(helm-ag-insert-at-point 'symbol)
  '(helm-ag-ignore-buffer-patterns '("\\.txt\\'" "\\.mkd\\'")))


  ;;
;; The following snippet tells Projectile to use Helm-ag for project searches
;; (C-c p s s)
;; The `helm-projectile' version is better as it is fully interactive.
;;

;; taken from: https://github.com/bbatsov/helm-projectile/blob/master/helm-projectile.el
;; Thanks @bbastov
(defun helm-projectile-ag (&optional options)
  "Helm version of `projectile-ag'."
  (interactive (if current-prefix-arg (list (helm-read-string "option: " "" 'helm-ag--extra-options-history))))
  (if (require 'helm-ag nil t)
      (if (projectile-project-p)
          (let* ((grep-find-ignored-files (cl-union (projectile-ignored-files-rel) grep-find-ignored-files))
                 (grep-find-ignored-directories (cl-union (projectile-ignored-directories-rel) grep-find-ignored-directories))
                 (ignored (mapconcat (lambda (i)
                                       (concat "--ignore " i))
                                     (append grep-find-ignored-files grep-find-ignored-directories (cadr (projectile-parse-dirconfig-file)))
                                     " "))
                 (helm-ag-base-command (concat helm-ag-base-command " " ignored " " options))
                 (current-prefix-arg nil))
            (helm-do-ag (projectile-project-root) (car (projectile-parse-dirconfig-file))))
        (error "You're not in a project"))
    (when (yes-or-no-p "`helm-ag' is not installed. Install? ")
      (condition-case nil
          (progn
            (package-install 'helm-ag)
            (helm-projectile-ag options))
        (error (error "`helm-ag' is not available.  Is MELPA in your `package-archives'?"))))))
