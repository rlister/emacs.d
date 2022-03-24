;;; no-mouse-mode.el --- disable mouse and trackpad

;; Version: 0

;;;###autoload
(define-minor-mode no-mouse-mode
  "Minor mode to disable trackpad clicks."
  :lighter " nm"
  :group 'mouse
  :global t
  :keymap
  (let ((map (make-sparse-keymap)))
    (define-key map [mouse-1] #'ignore)
    (define-key map [C-mouse-1] #'ignore)
    (define-key map [down-mouse-1] #'ignore)
    (define-key map [C-down-mouse-1] #'ignore)
    (define-key map [mouse-3] #'ignore)
    (define-key map [C-mouse-3] #'ignore)
    (define-key map [down-mouse-3] #'ignore)
    (define-key map [C-down-mouse-3] #'ignore)
    map))

(provide 'no-mouse-mode)

;;; no-mouse-mode.el ends here
