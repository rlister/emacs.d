;;; prr-mode.el --- Major mode for prr files.
;;
;; Copyright (C) 2025 by Ric Lister
;;
;; Author: Ric Lister
;; Version: 0.1
;; URL: https://github.com/rlister/prr-mode
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; This is a major mode for using the prr Github pull request review
;; tool. See: https://github.com/danobi/prr.
;;
;; Usage:
;;
;; Install and configure the `prr` tool (see above).
;;
;; Add the following to your emacs config:
;;
;;   (add-to-list 'load-path "~/path/to/prr-mode")
;;   (autoload 'prr "prr-mode" nil t)
;;
;; For interactive use, run `M-x prr' and type the url for a pull
;; request. This command accepts any argument supported by the command
;; `prr get`.
;;
;; The PR diff will be displayed in a buffer, as if edited using `prr
;; edit`.
;;
;; This buffer will have syntax highlighting, and uses `outline-mode`
;; for code-folding at diffs and hunks. Edit the buffer as needed, see
;; `prr` docs: https://doc.dxuuu.xyz/prr/.
;;
;; Submit a review from the prr buffer using `M-x prr-submit`.
;;
;; Additional commands:
;; - `prr-browse`: open the current review in a browser
;; - `prr-forge`: visit the current review in forge, if you have it installed
;; - `prr-copy-url-as-kill`: copy the github url for the current review to the kill-ring
;; - `prr-remove`: remove the current review

;;; Code:

(defcustom prr-program "prr"
  "Name of prr binary."
  :type 'file)

(defcustom prr-font-lock-keywords
  '(("^> diff .*" 0 'diff-header t)
    ("^> @@ .*" 0 'diff-hunk-header t)
    ("^> \\(\\+.*\\)" 1 'diff-added t)
    ("^> \\(\\-.*\\)" 1 'diff-removed t)
    ("^> \\+\\{3\\}.*" 0 'diff-file-header t)
    ("^> \\-\\{3\\}.*" 0 'diff-file-header t)
    ("^> index .*" 0 'diff-index t)
    ("^>.*" 0 'diff-context append))
  "Font-lock expressions for prr diffs."
  :type 'sexp)

(defun prr-ask-save-buffer ()
  "Ask user to save buffer if modified."
  (and
   (buffer-modified-p)
   (y-or-n-p (format "Save %s?" (buffer-name)))
   (save-buffer)))

(defun prr-parts ()
  "Return PR parts from current file, as a list '(org repo pr)."
  (let ((parts (file-name-split (file-name-sans-extension buffer-file-name))))
    (nthcdr (- (length parts) 3) parts)))

(defun prr-handle ()
  "Return handle for current prr, as org/repo/pr."
  (let ((p (prr-parts)))
    (mapconcat 'identity p "/")))

(defun prr-url ()
  "Return url for current PR."
  (let ((p (prr-parts)))
    (format "https://github.com/%s/%s/pull/%s" (car p) (cadr p) (caddr p))))

(defun prr-browse ()
  "Open current PR in a browser."
  (interactive)
  (browse-url (prr-url)))

(defun prr-forge ()
  "Visit current PR using forge."
  (interactive)
  (forge-visit-topic-from-url (prr-url)))

(defun prr-copy-url-as-kill ()
  "Copy url of current PR."
  (interactive)
  (kill-new (prr-url)))

(defun prr-submit ()
  "Call prr and submit current PR."
  (interactive)
  (prr-ask-save-buffer)
  (when (buffer-modified-p)
    (error "not submitted"))
  (call-process prr-program nil "*Messages*" nil "submit" (prr-handle)))

(defun prr-remove ()
  "Call prr and remove current PR."
  (interactive)
  (let ((handle (prr-handle)))
    (and
     (y-or-n-p (format "Remove %s?" handle))
     (call-process prr-program nil "*Messages*" nil "remove" handle)))
     (y-or-n-p "Kill buffer?")
     (kill-buffer))

(transient-define-prefix prr-transient ()
  "Invoke transient menu for prr."
  ["PRR Commands"
   [("s" "Submit review" prr-submit)
    ("r" "Remove review" prr-remove)]
   [("b" "Browse review" prr-browse)
    ("f" "Visit review in forge" prr-forge)]
   [("w" "Copy URL of review" prr-copy-url-as-kill)]])

;;;###autoload
(defun prr (pr)
  "Call prr and edit diff."
  (interactive "sPR: ")
  (let ((buf "*prr*"))
    (call-process prr-program nil buf nil "get" pr)
    (setq fname (with-current-buffer buf (string-trim-right (buffer-string))))
    (kill-buffer buf)
    (find-file fname)))

;;;###autoload
(define-derived-mode prr-mode outline-mode "prr"
  "Major mode for github pull requests with prr."
  (defvar prr--outline-regexp "> \\(diff --git \\|@@ ...\\)")
  (setq-local outline-regexp prr--outline-regexp)
  (setq-local outline-level (lambda () (if (string-match-p "> @@ ..." (match-string 0)) 2 1)))
  (setq-local outline-minor-mode-use-buttons 'in-margins)
  (setq-local show-trailing-whitespace t)
  (diff-minor-mode)
  (font-lock-add-keywords nil prr-font-lock-keywords))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.prr\\'" . prr-mode))

(provide 'prr-mode)

;;; prr-mode.el ends here
