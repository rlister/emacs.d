;; make C-e move to end of line, then end before comment
;; from http://emacswiki.org/emacs/BackToIndentationOrBeginning

(defun end-of-code-or-line () 
   "Move to EOL. If already there, to EOL sans comments.
    That is, the end of the code, ignoring any trailing comment
    or whitespace.  Note this does not handle 2 character 
    comment starters like // or /*.  Such will not be skipped."
    (interactive)
    (if (not (eolp))
        (end-of-line)
      (skip-chars-backward " \t")
      (let ((pt (point))
            (lbp (line-beginning-position))
            (lim))
        (when (re-search-backward "\\s<" lbp t)
          (setq lim (point))
          (if (re-search-forward "\\s>" (1- pt) t)
              (goto-char pt)
            (goto-char lim)               ; test here ->
          (while (looking-back "\\s<" (1- (point)))
            (backward-char))
          (skip-chars-backward " \t"))))))

(global-set-key (kbd "C-e") 'end-of-code-or-line) ;was move-end-of-line
