;;; ric-lib.el --- useful functions

;; Version: 0

;;;###autoload
(defun ric-copy-line ()
  "Copy whole line, leaving point in current position."
  (interactive)
  (save-excursion
    (end-of-line)
    (copy-region-as-kill (line-beginning-position) (point))))

;; ;;;###autoload
;; (defun ric-isearch-exit-other-end ()
;;   "Exit isearch at other end of string."
;;   (interactive)
;;   (isearch-exit)
;;   (goto-char isearch-other-end))

;;;###autoload
(defun ric-unfill-paragraph (&optional region)
  "Reverse operation to fill-paragraph."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

;;;###autoload
(defun ric-mark-args (&optional arg allow-extend)
  "Advise mark-word to move backwards if we are effectively at end of line."
  (if (looking-at "\\W*$")
      (list -1 t)
    (list arg t)))

;;;###autoload
(defun ric-code-review-link-hint ()
  (interactive)
  (link-hint-copy-link)
  (code-review-start (current-kill 0)))

;;;###autoload
(defun ric-mark-inside-thing (thing &optional exchange)
  "Set point at beginning inside THING and mark at end, or
vice-versa if arg EXCHANGE is non-nil."
  (let ((bounds (bounds-of-thing-at-point thing)))
    (goto-char (+ (car bounds) 1))
    (push-mark (- (cdr bounds) 1) t t))
  (when exchange (exchange-point-and-mark)))

;;;###autoload
(defun ric-mark-string-forward ()
  "Jump forward to next syntactical string, or use current if
inside string, and mark region inside delimiters."
  (interactive)
  (when (eq last-command this-command)
    (exchange-point-and-mark) (forward-char))
  (skip-syntax-forward "^\"")
  (ric-mark-inside-thing 'string))

;;;###autoload
(defun ric-mark-string-backward ()
  "Jump backward to next syntactical string, or use current if
inside string, and mark region inside delimiters."
  (interactive)
  (when (eq last-command this-command)
    (backward-char))
  (skip-syntax-backward "^\"")
  (backward-char)
  (ric-mark-inside-thing 'string))

;;;###autoload
(defun ric-mark-paren-forward (&optional count)
  "Jump forward to next syntactical parentheses and set region inside delimiters."
  (interactive "p")
  (re-search-forward "\\s(" nil nil count)
  (ric-mark-inside-thing 'list))

;;;###autoload
(defun ric-mark-paren-backward (&optional count)
  "Jump forward to next syntactical parentheses and set region inside delimiters."
  (interactive "p")
  (re-search-backward "\\s)" nil nil count)
  (ric-mark-inside-thing 'list t))

(provide 'ric-lib)

;;; ric-lib.el ends here
