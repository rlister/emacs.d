(defun goto-top-or-bottom ()
  "Go to top of buffer, unless already there, in which case go to bottom."
  (interactive)
  (if (= (point) (point-min))
      (goto-char (point-max))
    (goto-char (point-min))))
