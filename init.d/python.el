(use-package python
  :ensure t
  :mode (("\\.py\\'" . python-mode)
	 ("\\.wsgi$" . python-mode))
  :interpreter ("ipython" . python-mode)
  :init (setq-default indent-tabs-mode nil)
  :config (setq python-indent-offset 4))
