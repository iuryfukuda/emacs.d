;; Pre-requisites:
;; rustup default nightly
;; cargo component add rust-src
;; cargo +nightly install racer

;; Flycheck-Begin. On the fly syntax checking for multiple programming languages.
;; Enable Flycheck in buffers with supported languages.
(use-package flycheck :ensure t)
(use-package flycheck-rust
  :ensure t
  :if (featurep 'flycheck)
  :after (rust-mode flycheck)
  :init
  (add-hook 'rust-mode-hook 'flycheck-mode)
  (add-hook 'flycheck-mode-hook 'flycheck-rust-setup))

(use-package rust-mode
  :hook (rust-mode . lsp)
  :ensure t
  :bind
  ("C-c g" . rust-run)
  ("C-c t" . rust-test)
  ("C-c b" . cargo-process-build)
  :init
  (which-function-mode 1)
  (setq compilation-error-regexp-alist-alist
      (cons '(cargo "^\\([^ \n]+\\):\\([0-9]+\\):\\([0-9]+\\): \\([0-9]+\\):\\([0-9]+\\) \\(?:[Ee]rror\\|\\([Ww]arning\\)\\):" 1 (2 . 4) (3 . 5) (6))
        compilation-error-regexp-alist-alist))
  :config
  (setq rust-format-on-save t))

(use-package racer :ensure t
  :init
  (add-hook 'rust-mode-hook 'racer-mode)
  :config
  (progn
    (add-hook 'rust-mode-hook #'racer-mode) ;; Activate racer in rust buffers.
    (add-hook 'racer-mode-hook #'eldoc-mode) ;; Shows signature of current function in minibuffer.
    ;; Rust completions with Company and Racer.
    (add-hook 'racer-mode-hook #'company-mode)
    )
  (when (featurep 'company)
    (add-hook 'racer-mode-hook 'company-mode)
    (bind-key "TAB" 'company-indent-or-complete-common rust-mode-map))
  (add-hook 'racer-mode-hook 'eldoc-mode)
  :bind (:map rust-mode-map
         ("C-c C-t" . racer-describe)))

(use-package company :ensure t
  :config
  (setq company-idle-delay 0.2)
  (add-hook 'racer-mode-hook
    (lambda ()
      (setq-local company-tooltip-align-annotations t)))
  :bind (:map company-active-map
         ("C-h" . delete-backward-char)))

;; ;; Add keybindings for interacting with Cargo
(use-package cargo
  :ensure t
  :init
  (setenv "PATH" (concat (getenv "PATH") ":~/.cargo/bin"))
  (setq exec-path (append exec-path '("~/.cargo/bin")))
  :hook (rust-mode . cargo-minor-mode)
  :diminish cargo-minor-mode
  :config
  (progn
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (add-hook 'toml-mode-hook 'cargo-minor-mode)))

(use-package rust-playground
  :ensure t
  :commands (rust-playground))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Flycheck Rust support.
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;; Flycheck-End.

;; Path to rust source.
(when (equal system-type 'gnu/linux)
  (setq racer-rust-src-path (concat (getenv "HOME") "/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library")))
(when (equal system-type 'darwin)
  (setq racer-rust-src-path (concat (getenv "HOME") "/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src")))
;; Racer bin path.
(setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))

;; Map TAB key to completions.
(local-set-key (kbd "TAB") 'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; Rust-End.









