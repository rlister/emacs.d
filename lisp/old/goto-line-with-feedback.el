;; turn on linum-mode temporarily while doing goto-line
;; adapted from http://whattheemacsd.com/key-bindings.el-01.html
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (if (and (boundp 'linum-mode) linum-mode)
      (call-interactively 'goto-line)
    (unwind-protect
        (progn
          (linum-mode 1)
          (call-interactively 'goto-line))
      (linum-mode -1))))

(global-set-key [remap goto-line] 'goto-line-with-feedback) ;replace goto-line
