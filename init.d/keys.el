;; changes in default keys
(global-set-key (kbd "<f1>") 'help-command)
(global-set-key (kbd "M-s") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; movement in panels
(global-set-key (kbd "C-c b")  'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p")    'windmove-up)
(global-set-key (kbd "C-c n")  'windmove-down)

;; set copy to X clipboard (when -nw is used)
(global-set-key (kbd "M-w") 'copy-to-clipboard)
(global-set-key (kbd "C-y") 'paste-from-clipboard)
(global-set-key (kbd "C-w") 'kill-to-clipboard)
