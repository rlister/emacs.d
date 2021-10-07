(defun unfill-paragraph (&optional region)
  "Opposite of fill-paragraph."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

(define-key global-map (kbd "M-Q") 'unfill-paragraph)
