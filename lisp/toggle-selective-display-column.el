;; basic outlining for arbitrary code or indented text
(defun toggle-selective-display-column ()
  "Set selective display fold everything greater than the current column, or toggle off if active."
  (interactive)
  (set-selective-display
   (if selective-display nil (or (+ (current-column) 1) 1))))

;; broke in tty
;(global-set-key (kbd "C-TAB") 'toggle-selective-display-column)

(global-set-key (kbd "C-c TAB") 'toggle-selective-display-column)
