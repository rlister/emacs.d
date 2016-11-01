(use-package simple
  :config
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  :bind
  ("C-m" . newline-and-indent) ;make RET indent
  ("C-c TAB" . ric/toggle-selective-display-column)
  )

(defun ric/toggle-selective-display-column ()
  "Set selective display fold everything greater than the current column, or toggle off if active."
  (interactive)
  (set-selective-display
   (if selective-display nil (or (+ (current-column) 1) 1))))