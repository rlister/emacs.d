;; whitespace handling
;; (setq-default show-trailing-whitespace t)

(defalias 'ws 'whitespace-mode)
(defalias 'wc 'whitespace-cleanup)

;; toggle auto-fill
;; (global-set-key (kbd "C-x C-a") 'auto-fill-mode)
(toggle-text-mode-auto-fill)       ;always auto-fill in text mode,

;; use me like:
;;   (add-hook 'foo-mode-hook 'whitespace-cleanup-on-save)
;; (defun whitespace-cleanup-on-save ()
;;   "Add me to a mode hook to clean whitespace when saving buffer."
;;   (add-hook 'before-save-hook 'whitespace-cleanup nil t))

;; built-in to emacs since v21
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; or you can add this hook locally for particular mode
;(add-hook ‘c-mode-hook (lambda () (add-to-list ‘write-file-functions ‘delete-trailing-whitespace)))
