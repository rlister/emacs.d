(defun line-cleanup ()
  "Remove all blank lines in region."
  (interactive "*")
  (flush-lines "^$" (point) (mark)))
