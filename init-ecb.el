(add-to-list 'load-path (directory-of-library "ecb"))
;;compatible settings
(setq stack-trace-on-error t)

(require 'ecb)

;;active/deactive shortcuts
(global-set-key (kbd "C-c C-a") 'ecb-activate)
(global-set-key (kbd "C-c C-d") 'ecb-deactivate)

(provide 'init-ecb)
