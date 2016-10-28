(defun comment-region-or-line (&optional arg)
  "Toggle comments on region if active, otherwise toggle comment on line."
  (interactive "P")
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end) arg)
    (comment-or-uncomment-region (line-beginning-position) (line-end-position) arg)))

(global-set-key (kbd "C-z ;") 'comment-region-or-line)