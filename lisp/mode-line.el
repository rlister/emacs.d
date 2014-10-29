(column-number-mode 1)             ;turn on column numbers in modeline
(display-battery-mode 1)           ;turn on battery display in modeline

;; (setq display-time-load-average t) ;display time and load average in modeline
;; (setq display-time-load-average-threshold 0.0)
;; (setq display-time-format "%a%d/%H:%M")
;; (display-time-mode 1)

;; (setq
;;  mode-line-format
;;  '(
;;    mode-line-front-space
;;    mode-line-mule-info
;;    mode-line-client
;;    mode-line-modified
;;    mode-line-remote
;;    mode-line-frame-identification
;;    mode-line-buffer-identification
;;    "   "
;;    mode-line-position
;;    (vc-mode vc-mode)
;;    "  "
;;    mode-line-modes
;;    mode-line-misc-info
;;    hvmode-line-end-spaces)

;; wget http://webonastick.com/emacs-lisp/hide-mode-line.el
(autoload 'hide-mode-line "hide-mode-line" nil t)
(hide-mode-line)

;; e.g. use (mode-line-fill 'mode-line 10) "Hello world"
;; (defun mode-line-fill (face reserve)
;;   "Return empty space using FACE and leaving RESERVE space on the right."
;;   (unless reserve
;;     (setq reserve 20))
;;   (when (and window-system (eq 'right (get-scroll-bar-mode)))
;;     (setq reserve (- reserve 3)))
;;   (propertize " "
;;               'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
;;               'face face))

;; (setq-default mode-line-format
;;               (list
;;                " " mode-line-modified
;;                " " mode-line-buffer-identification
;;                " " mode-line-position
;;                ))
