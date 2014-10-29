(defun open-line-and-indent (&optional n)
  "Like open-line, but the line that is moved down is re-indented."
  (interactive "p")
  (open-line n)
  (save-excursion
    (forward-line n)
    (indent-according-to-mode)))

(global-set-key (kbd "C-o") 'open-line-and-indent) ;replaces open-line
