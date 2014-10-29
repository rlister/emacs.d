;; C-a moves to beginning of indentation, then beginning of line
;; from http://emacswiki.org/emacs/BackToIndentationOrBeginning
(defun beginning-or-indentation (&optional n)
  "Move cursor to beginning of this line or to its indentation.
  If at indentation position of this line, move to beginning of line.
  If at beginning of line, move to beginning of previous line.
  Else, move to indentation position of this line.
  With arg N, move backward to the beginning of the Nth previous line.
  Interactively, N is the prefix arg."
  (interactive "P")
  (cond ((or (bolp) n)
         (forward-line (- (prefix-numeric-value n))))
        ((save-excursion (skip-chars-backward " \t") (bolp)) ; At indentation.
         (forward-line 0))
        (t (back-to-indentation))))

(global-set-key (kbd "C-a") 'beginning-or-indentation) ;was move-beginning-of-line
