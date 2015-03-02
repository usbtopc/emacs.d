;;; package --- Auto Rsync
;;; Commentary:
;;; Author: @l3msh0 (Updated by sailing <2014-12-16>)
;;; Code:

(defgroup auto-rsync nil "Auto Rsync")
(defcustom auto-rsync-command "rsync" "Rsync command path." :group 'auto-rsync)
(defcustom auto-rsync-command-option "-avzq" "Rsync command option." :group 'auto-rsync)
(defcustom auto-rsync-dir-alist nil "Pair of rsync source and destination dir." :group 'auto-rsync)

(defun auto-rsync-exec-rsync ()
  "Execute rsync if editing file path match src dir."
  (interactive)
  (let* ((normalized-alist
          (mapcar
           (lambda (x)
             (cons (file-name-as-directory (expand-file-name (car x)))
                   (file-name-as-directory (cdr x))))
           auto-rsync-dir-alist))
         (sync-pair
          (assoc-if
           (lambda (key) (string-match key buffer-file-name))
           normalized-alist)))
    (when sync-pair
      (save-window-excursion
        (shell-command
         (format
          "%s %s %s %s &"
          auto-rsync-command
          auto-rsync-command-option
          (car sync-pair)
          (cdr sync-pair))
         nil)))))

(define-minor-mode auto-rsync-mode
  "automatically execute rsync when editing file's path matches `auto-rsync-dir-alist`"
  :lighter " rsync"
  :global t
  (cond (auto-rsync-mode
         (add-hook 'after-save-hook 'auto-rsync-exec-rsync))
        (t (remove-hook 'after-save-hook 'auto-rsync-exec-rsync))))

(provide 'init-rsync)
;;; init-rsync.el ends here
