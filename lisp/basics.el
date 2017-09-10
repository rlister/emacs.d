(setq default-directory "~/")      ;default dir
(setq pop-up-windows nil)          ;do not create new windows for display-buffer stuff
(setq inhibit-startup-message t)   ;no blurb when we start up
(setq initial-scratch-message "")  ;no bullshit in the scratch buffer
(setq ring-bell-function 'ignore)  ;do not beep for C-g or bad completions (esp on OSX)
(setq-default indent-tabs-mode nil) ;just for pablo no tabs evah in any mode
(fset 'yes-or-no-p 'y-or-n-p)      ;do not make me type the whole word

(set-default 'cursor-type 'bar)

;; make sure help buffers popup in current window, not other-window
(setq display-buffer-alist '((".*" display-buffer-same-window)))

(use-package select
  :config
  (setq x-select-enable-clipboard t) ;selection goes to system clipboard
  ;;(setq x-select-enable-primary t) ;selection goes to system clipboard
  )

(use-package cus-edit
  :config
  (setq custom-file "~/.emacs.d/custom.el") ;do not stick customizations in .emacs or init.el
)

(setq tramp-mode nil)

;;make C-z a prefix key in most modes, we use this a lot later
(global-set-key (kbd "C-z") nil)