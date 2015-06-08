;; windmove - S-{left,right,up,down} to change windows
(windmove-default-keybindings)
(setq windmove-wrap-around 't)          ;; wraparound instead of errors

;; C-x o is other-window, which is next window in clockwise order
;; make C-x p go anti-clockwise (previous window)
(defun prev-window ()
  (interactive)
  (other-window -1))

(define-key global-map (kbd "C-x p") 'prev-window)
(define-key global-map (kbd "M-o")   'other-window) ;convenience, replaces facemenu-keymap
(define-key global-map (kbd "M-p")   'prev-window)  ;replaces empty binding

;; winner-mode - pop window configuration
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; install from melpa
(golden-ratio-mode 1)
