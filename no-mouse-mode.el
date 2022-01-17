;;;###autoload
(define-minor-mode no-mouse-mode
  "Minor mode to disable trackpad clicks."
  :lighter " nm"
  :global t
  :keymap
  (let ((map (make-sparse-keymap)))
    (define-key map [mouse-1] #'ignore)
    (define-key map [down-mouse-1] #'ignore)
    (define-key map [mouse-3] #'ignore)
    (define-key map [down-mouse-3] #'ignore)
    map))

(provide 'no-mouse-mode)
