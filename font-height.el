(defun font-height-adjust (factor)
  "Adjust default font height for current frame by scaling factor."
  (let* ((cur (face-attribute 'default :height))
         (new (* factor cur))
         (rnd (* 10 (round new 10))))    ;round to nearest 10
    (set-face-attribute 'default (selected-frame) :height rnd)
    (message "font height %d -> %d" cur rnd)
    (run-with-timer 3 nil #'(lambda () (message nil)))))

;;;###autoload
(defun font-height-increase ()
  "Increase font height."
  (interactive)
  (font-height-adjust 1.1))

;;;###autoload
(defun font-height-decrease ()
  "Decrease font height."
  (interactive)
  (font-height-adjust 0.9))

;;;###autoload
(defun font-height-reset ()
  "Reset font height to value configured at startup."
  (interactive)
  (set-face-font 'default "fontset-startup"))

(provide 'font-height)
