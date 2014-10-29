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
(setq make-backup-files nil)       ;do not make ~ backup files
(setq ring-bell-function 'ignore)  ;do not beep for C-g or bad completions (esp on OSX)
(setq custom-file "~/.emacs.d/custom.el") ;do not stick customizations in .emacs or init.el
(setq x-select-enable-clipboard t) ;selection goes to system clipboard

(setq-default indent-tabs-mode nil) ;just for pablo no tabs evah in any mode

(fset 'yes-or-no-p 'y-or-n-p)      ;do not make me type the whole word

;; narrowing buffer
;; c-x n n     Narrow down to between point and mark (narrow-to-region).
;; C-x n w     Widen to make the entire buffer accessible again (widen).
;; C-x n p     Narrow down to the current page (narrow-to-page).
;; C-x n d     Narrow down to the current defun (narrow-to-defun).
(put 'narrow-to-region 'disabled nil) ;do not disable it, I'm not a newb

(global-set-key (kbd "C-m") 'newline-and-indent) ;make RET indent

(global-set-key (kbd "M-z") 'undo)            ;cua-compat undo
(global-set-key (kbd "C-z") 'zap-to-char)     ;as I stole M-z, replace suspend-frame

(global-set-key (kbd "M-s s")   'replace-string)
(global-set-key (kbd "M-s M-s") 'replace-string)

;(setq help-window-select 'always)  ;select the buffer displaying help (so I can quit it easily)

;(setq-default indent-tabs-mode nil);always indent with spaces, not tabs

;; make sure help buffers popup in current window, not other-window
(setq display-buffer-alist '((".*" display-buffer-same-window)))

;; visible chars for TAB
;; can reset this with (set-window-display-table nil nil)
(let ((d (make-display-table)))
  (aset d 9 (vector ?⇥ ? ? ? ? ? ? ? ))
  (set-window-display-table nil d))
