(defun camel-to-snake ()
  (interactive)
  (progn
    (replace-regexp "\\([A-Z]\\)" "_\\1" nil (region-beginning) (region-end))
    (downcase-region (region-beginning) (region-end))))