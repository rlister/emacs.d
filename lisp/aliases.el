;; (defalias 'er 'eval-region)
;; ;(defalias 'es 'eval-last-sexp)
;; (defalias 'ee 'eval-expression)
;; (defalias 'fp 'fill-paragraph)

;; some register aliases
;; (defalias 'rc 'copy-to-register)
;; (defalias 'ri 'insert-register)
;; (defalias 'rp 'point-to-register)
;; (defalias 'rj 'jump-to-register)
;; (defalias 'rl 'list-registers)
;; also C-u C-SPC jumps to make popped from mark ring

(defun rb ()
  "Reload buffer after file has changed."
  (interactive)
  (revert-buffer t t t))