;; melpa swiper pkg also installs ivy and counsel
(ivy-mode 1)
(setq
 ;; ivy-use-virtual-buffers t ;add recentf and bookmark buffers to the list
 projectile-completion-system 'ivy   ;use ivy for all projectile stuff
 ivy-format-function 'ivy-format-function-arrow
 )

;; try this instead of smex
(global-set-key (kbd "C-x m")   'counsel-M-x)  ;use this instead of M-x
(global-set-key (kbd "C-x C-m") 'counsel-M-x)  ;common typo

;; instead of browse-kill-ring package
(global-set-key (kbd "M-y") 'counsel-yank-pop)(global-set-key (kbd "M-m")     'counsel-imenu)
