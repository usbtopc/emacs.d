(require-package 'visual-regexp)

(global-set-key (kbd "M-`") 'other-window)
(global-set-key (kbd "C-c C-/") 'vr/replace)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "M-p") 'scroll-other-window-down)
(global-set-key (kbd "M-n") 'scroll-other-window)

(when window-system
  (global-set-key (kbd "C-x C-c")
                  #'(lambda ()
                      (interactive)
                      (if (y-or-n-p (format "Really exit? "))
                          (if (< emacs-major-version 22)
                              (save-buffers-kill-terminal)
                            (save-buffers-kill-emacs))
                        (message "Canceled exit")))))

(provide 'init-keybindings)
