(use-package python
  :ensure t
  :mode (("\\.py\\'" . python-mode)
	 ("\\.wsgi$" . python-mode))
  :interpreter ("ipython" . python-mode)
  :init (setq-default indent-tabs-mode nil)
  :config
  (setq python-indent-offset 4)
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "--simple-prompt")))


