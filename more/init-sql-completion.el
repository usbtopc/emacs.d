(require 'sql-completion)
(setq sql-interactive-mode-hook
      (lambda ()
        (define-key sql-interactive-mode-map "\t" 'comint-dynamic-complete)
        (sql-mysql-completion-init)))

(provide 'init-sql-completion)
