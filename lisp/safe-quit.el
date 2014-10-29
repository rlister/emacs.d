;; who really wants to quit emacs anyway?
(defun safe-quit ()
  (interactive)
  (and (yes-or-no-p "Quit, really? ")
      (save-buffers-kill-terminal)))

;; do not bind in terminal emacs
(when window-system
  (define-key global-map "\C-x\C-c" 'safe-quit))
