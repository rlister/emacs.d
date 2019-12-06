(use-package align
  :init
  (defalias 'ar 'align-regexp)
  :bind
  ("C-x :" . ric/align-to-colon)
  ("C-M-s-a" . align-regexp)
  )

(defun ric/align-to-colon (begin end)
  "Align region to char after colon, e.g. ruby hashes, js, yaml, etc."
  (interactive "r")
  (align-regexp begin end
                (rx ":" (group (zero-or-more (syntax whitespace))) ) 1 1 ))