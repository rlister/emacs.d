(toggle-text-mode-auto-fill)       ;always auto-fill in text mode,
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun ric-space-dwim (beg end)
  "If region set, canonically space it, otherwise compress space at point."
  (interactive "r")
  (if (region-active-p)
      (canonically-space-region beg end)
    (just-one-space)))

;; was toggle-input-method
(define-key global-map (kbd "C-\\") 'ric-space-dwim)