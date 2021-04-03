(use-package python
  :mode (("\\.py\\'" . python-mode)
	 ("\\.wsgi$" . python-mode))
  :interpreter ("ipython" . python-mode)
  :init
  (setq-default indent-tabs-mode nil)
  (setq python-indent-offset 4)
  :config
  (setq python-shell-interpreter "ipython"
        py-shell-name "python"
        python-shell-interpreter-args "-i --simple-prompt"))

;; Elpy
(use-package elpy
  :straight (elpy
             :type git
             :flavor melpa
             :files ("*.el" "NEWS.rst" "snippets" "elpy" "elpy-pkg.el")
             :host github
             :repo "jorgenschaefer/elpy")
  :commands elpy-enable
  :interpreter ("ipython" . python-mode)
  :init
  (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  (add-to-list 'auto-mode-alist '("\\.wsgi$" . python-mode))
  (with-eval-after-load 'python (elpy-enable))
  (setq elpy-rpc-backend "jedi")
  :bind
  (:map elpy-mode-map
	("M-." . elpy-goto-definition)
	("M-," . pop-tag-mark)))


