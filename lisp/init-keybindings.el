(require-package 'visual-regexp)

(global-set-key (kbd "M-`") 'other-window)
(global-set-key (kbd "C-c C-/") 'vr/replace)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "M-p") 'scroll-other-window)
(global-set-key (kbd "M-n") 'scroll-other-window-down)

(provide 'init-keybindings)
