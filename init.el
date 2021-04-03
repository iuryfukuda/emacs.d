;;; Global initial configs

(menu-bar-mode 0) ; remove menu bar
(setq column-number-mode t) ; add col number
;; (global-font-lock-mode 0) ; remove color
;; (global-linum-mode 1) ; add line numbers
(electric-pair-mode) ; auto pair

;; set split window verticaly by default
(setq split-width-threshold 0)
(setq split-height-threshold nil)

;; disable startup screen
(setq inhibit-startup-screen t)

;; define font
(set-face-attribute 'default nil :height 100)

(defun graphic-config (&optional frame)
  (or frame (setq frame (selected-frame)))
  (with-selected-frame frame
    (when (display-graphic-p)
      (scroll-bar-mode -1) ; remove scroll bar
      (tool-bar-mode -1) ; remove tool bar
      (set-fringe-mode 0)))) ; remove border

;; add graphic configs if is window-system mode
(graphic-config) ; without --daemon
(add-hook 'after-make-frame-functions 'graphic-config) ; with --daemon

(setq vc-follow-symlinks t) ; Allways follow the links to real file

;;; Packages

(require 'package)

;; set reposities to find packages
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

;; activate all the packages
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; prefer newer packages
(setq load-prefer-newer t)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; Libraries

;; expand name of all libraries
(setq lib-directory (expand-file-name "init.d" user-emacs-directory))
(setq libs (directory-files lib-directory nil "^[a-z-1-9]+.el$"))

;; load all libraries
(dolist (lib libs)
  (load-file (expand-file-name lib lib-directory)))

(put 'dired-find-alternate-file 'disabled nil)

;;; Emacs Custom Config

;; set emacs custom-configs to separated file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; custom default tab width
(defun my-generate-tab-stops (&optional width max)
  "Return a sequence suitable for `tab-stop-list'."
  (let* ((max-column (or max 200))
         (tab-width (or width tab-width))
         (count (/ max-column tab-width)))
    (number-sequence tab-width (* tab-width count) tab-width)))

(setq tab-width 2)
(setq tab-stop-list (my-generate-tab-stops))

;; base64 encode without break lines
(defun base64-encode-region-prefix-arg (&rest _args)
  "Pass prefix arg as third arg to `base64-encode-region'."
  (interactive "r\nP"))

(advice-add 'base64-encode-region :before #'base64-encode-region-prefix-arg)
