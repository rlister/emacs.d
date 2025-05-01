;;; ric-lib.el --- useful functions

;; Version: 0

(defun mark-sexp-at-point ()
  "Mark sexp at point. If no sexp at point, move forward and mark next sexp."
  (interactive)
  (or (thing-at-point 'sexp) (forward-sexp))
  (let ((bounds (bounds-of-thing-at-point 'sexp)))
    (when (null bounds) (error "No sexp at point"))
    (goto-char (car bounds))
    (push-mark nil t t)
    (goto-char (cdr bounds))))

;;;###autoload
(defun mark-line ()
  "Mark whole line, leaving point in current position."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position))
  (activate-mark))

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

;; ;;;###autoload
;; (defun ric-mark-args (&optional arg allow-extend)
;;   "Advise mark-word to move backwards if we are effectively at end of line."
;;   (if (looking-at "\\W*$")
;;       (list -1 t)
;;     (list arg t)))

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
