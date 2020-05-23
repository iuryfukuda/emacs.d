(use-package w3m
  :ensure t
  :bind
  ("C-x g" . browse-url-at-point)
  :config
  (setq browse-url-browser-function 'w3m-browse-url)
  (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t))
