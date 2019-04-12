;; windmove - S-{left,right,up,down} to change windows
;; (windmove-default-keybindings)
;; (setq windmove-wrap-around 't)          ;; wraparound instead of errors

;; C-x o is other-window, which is next window in clockwise order
;; make C-x p go anti-clockwise (previous window)
(defun prev-window ()
  (interactive)
  (other-window -1))

(define-key global-map (kbd "C-o") 'other-window)
(define-key global-map (kbd "C-x p") 'prev-window)

;; TODO: get these workig in exwm
(define-key global-map (kbd "M-j") 'other-window)
(define-key global-map (kbd "M-k") 'prev-window)
;; (define-key global-map (kbd "M-o")   'other-window) ;convenience, replaces facemenu-keymap
;; (define-key global-map (kbd "M-p")   'prev-window)  ;replaces empty binding

;; install from melpa
;; (golden-ratio-mode 1)

;; splits
(define-key global-map (kbd "C-0") 'delete-window)
(define-key global-map (kbd "C-1") 'delete-other-windows)
(define-key global-map (kbd "C-2") 'split-window-below)
(define-key global-map (kbd "C-3") 'split-window-right)
