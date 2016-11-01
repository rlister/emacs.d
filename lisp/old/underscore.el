;; replace spaces with underscores
(defun underscore ()
  "Replaces all spaces with underscores in the region."
  (interactive "*")
  (narrow-to-region  (point) (mark))
    (goto-char (point-min))
    (replace-string " " "_")
    (widen))