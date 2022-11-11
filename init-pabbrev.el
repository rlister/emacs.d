(defun ric-pabbrev-suggestions-insert (word)
  "Insert suggestion from completing-read."
  (let ((point))
    (save-excursion
      (let ((bounds (pabbrev-bounds-of-thing-at-point)))
        (progn
          (delete-region (car bounds) (cdr bounds))
          (insert word)
          (setq point (point)))))
    (if point
        (goto-char point))))

(defun ric-pabbrev-suggestions-completing-read (list)
  "Use completing-read to select suggestions."
  (when list
    (ric-pabbrev-suggestions-insert pabbrev-expand-previous-word)
    (ric-pabbrev-suggestions-insert
     (completing-read "Pabbrev: " (mapcar 'car list)))))

(fset 'pabbrev-suggestions-goto-buffer 'ric-pabbrev-suggestions-completing-read)
