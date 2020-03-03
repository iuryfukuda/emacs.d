;;; Global configs

(menu-bar-mode -1) ; remove menu bar
;; (global-font-lock-mode 0) ; remove color
;; (global-linum-mode 1) ;; add line numbers

;; disable startup screen
(setq inhibit-startup-screen t)

;; graphic configs for X
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

;;; Libraries

;; Load libraries configs
(add-to-list 'load-path "~/.emacs.d/init.d")

;; set libraries
(setq libs
      '(
	;; system changes
	"keys"
	"clipboard"

	;; use-package
	"theme"

	"go"
	"elixir"
	))

;; load all libraries
(dolist (lib libs)
  (load-library lib))

;;; Emacs Custom Config

;; set emacs custom-configs to separated file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
