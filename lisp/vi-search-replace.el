;; from http://www.emacswiki.org/emacs/ViSearchAndReplace
(global-set-key (kbd "C-/") 'vi-search-replace)

(defun vi-search-replace (arg)
  "Search and optionally replace a regular expression.
ARG has one of the following forms:

REGEXP
  a simple `re-search-forward'
REGEXP/TO-STRING
  replace the next occurence
REGEXP/TO-STRING/g
  replace all remaining occurences using `replace-regexp'"
  (interactive "sregexp/replace: ")
  (let ((args (split-string arg "/")))
    (cond ((= (length args) 1)
	   (apply 're-search-forward args))
	  ((or (= (length args) 2)
	       (string= (third args) ""))
	   (when (re-search-forward (first args))
	     (replace-match (second args))))
	  ((and (= (length args) 3)
		(string= (third args) "g"))
	   (replace-regexp (first args) (second args)))
	  (t (error "Please provide a string of the form REGEXP/TO-STRING/g")))))
