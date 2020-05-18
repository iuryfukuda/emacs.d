;; changes in default keys
(global-set-key (kbd "<f1>") 'help-command)
(global-set-key (kbd "M-p") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; movement in panels
(global-set-key (kbd "C-c b")  'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p")    'windmove-up)
(global-set-key (kbd "C-c n")  'windmove-down)

;; set copy to X clipboard (when -nw is used)
(global-set-key (kbd "C-c w") 'copy-to-clipboard)
(global-set-key (kbd "C-c y") 'paste-from-clipboard)
(global-set-key (kbd "C-c C-w") 'kill-to-clipboard)

;; buffer
(global-set-key (kbd "C-x j") 'next-buffer)
(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-x x e") 'eval-buffer)
(global-set-key (kbd "C-x x r") 'revert-buffer)
(global-set-key (kbd "C-x x d") 'diff-buffer-with-file)
