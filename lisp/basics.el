(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)             ;or I will kill you

(delete-selection-mode 1)          ;replace region on typing (turns on transient-mark-mode)
(setq default-directory "~/")      ;default dir
(setq pop-up-windows nil)          ;do not create new windows for display-buffer stuff
(setq inhibit-startup-message t)   ;no blurb when we start up
(setq initial-scratch-message "")  ;no bullshit in the scratch buffer
(setq require-final-newline nil)   ;allow save if does not end with a newline
(setq mode-require-final-newline nil)   ;stop some modes from setting require-final-newline t
(setq make-backup-files nil)       ;do not make ~ backup files
(setq ring-bell-function 'ignore)  ;do not beep for C-g or bad completions (esp on OSX)
(setq custom-file "~/.emacs.d/custom.el") ;do not stick customizations in .emacs or init.el
(setq x-select-enable-clipboard t) ;selection goes to system clipboard
;(setq x-select-enable-primary t) ;selection goes to system clipboard

(setq-default indent-tabs-mode nil) ;just for pablo no tabs evah in any mode
(setq tramp-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)      ;do not make me type the whole word

;; narrowing buffer
;; c-x n n     Narrow down to between point and mark (narrow-to-region).
;; C-x n w     Widen to make the entire buffer accessible again (widen).
;; C-x n p     Narrow down to the current page (narrow-to-page).
;; C-x n d     Narrow down to the current defun (narrow-to-defun).
(put 'narrow-to-region 'disabled nil) ;do not disable it, I'm not a newb

(global-set-key (kbd "C-m") 'newline-and-indent) ;make RET indent

;; make sure help buffers popup in current window, not other-window
(setq display-buffer-alist '((".*" display-buffer-same-window)))

;; visible chars for TAB
;; can reset this with (set-window-display-table nil nil)
;; (let ((d (make-display-table)))
;;   (aset d 9 (vector ?⇥ ? ? ? ? ? ? ? ))
;;   (set-window-display-table nil d))

;; man page in same window
(setq Man-notify-method 'pushy)

;; use built-in midnight-mode to cleanup old buffers every night
;; (require 'midnight)
;; (setq clean-buffer-list-delay-general 1) ;kill buffers older than 1 day

;;make C-z a prefix key in most modes, we use this a lot later
(global-set-key (kbd "C-z") nil)