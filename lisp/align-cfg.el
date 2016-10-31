(use-package align
  :bind
  ("C-x :" . ric/align-to-colon)
  :config
  (defalias 'ar 'align-regexp)
  )

(defun ric/align-to-colon (begin end)
  "Align region to char after colon, e.g. ruby hashes, js, yaml, etc."
  (interactive "r")
  (align-regexp begin end
                (rx ":" (group (zero-or-more (syntax whitespace))) ) 1 1 ))