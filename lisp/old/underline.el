;; underlining text for e.g. markdown

(defun prev-line-length ()
  "Return length of previous line."
  (save-excursion
    (forward-line -1)
    (end-of-line)
    (current-column)))

(defun underline-prev-line (line-char)
  "Underline previous line with given char."
  (interactive "center line character")
  (dotimes (i (prev-line-length)) (insert line-char)))

(defalias 'ul 'underline-prev-line)

(defun ul- ()
  (interactive)
  (underline-prev-line "-"))

(defun ul= ()
  (interactive)
  (underline-prev-line "="))
