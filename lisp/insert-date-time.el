(defun date ()
  "Insert today's date at point."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun time ()
  "Insert current time at point."
  (interactive)
  (insert (format-time-string "%H:%M:%S")))
