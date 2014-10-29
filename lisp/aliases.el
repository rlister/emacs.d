(defalias 'er 'eval-region)
;(defalias 'es 'eval-last-sexp)
(defalias 'ee 'eval-expression)
(defalias 'fp 'fill-paragraph)

;; some register aliases
;; (defalias 'rc 'copy-to-register)
;; (defalias 'ri 'insert-register)
;; (defalias 'rp 'point-to-register)
;; (defalias 'rj 'jump-to-register)
;; (defalias 'rl 'list-registers)
;; also C-u C-SPC jumps to make popped from mark ring

;; align blocks according to mode
(defalias 'ac 'align-current)
(defalias 'ar 'align-regexp)

(defalias 'sh 'shell-command)
(defalias 'df 'describe-face)

(defun rb ()
  "Reload buffer after file has changed."
  (interactive)
  (revert-buffer t t t))

;; (defun ckr ()
;;   "Clear the kill ring."
;;   (interactive)
;;   (setq kill-ring nil))

;; (defun shell-named ()
;;   "Invoke a shell named after pwd."
;;   (interactive)
;;   (shell (pwd)))
