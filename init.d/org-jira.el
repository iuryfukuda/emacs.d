(use-package org-jira
  :ensure t
  :init
  (make-directory "~/.org-jira" 1)
  :config
  (setq jiralib-url "https://gerentesdigitais.atlassian.net"))
