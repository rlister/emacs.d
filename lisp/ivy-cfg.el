;; melpa swiper pkg also installs ivy and counsel
;; (ivy-mode 1)
(setq ivy-format-function 'ivy-format-function-arrow)

;; use ivy for these modes
(setq projectile-completion-system 'ivy)
(setq magit-completing-read-function 'ivy-completing-read)

;; try this instead of smex
(global-set-key (kbd "C-x m")   'counsel-M-x)  ;use this instead of M-x
(global-set-key (kbd "C-x C-m") 'counsel-M-x)  ;common typo

;; instead of browse-kill-ring package
(global-set-key (kbd "M-y")     'counsel-yank-pop)
(global-set-key (kbd "C-h f")   'counsel-describe-function)
(global-set-key (kbd "C-h v")   'counsel-describe-variable)
(global-set-key (kbd "M-m")     'counsel-imenu)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(defun ric-indent-or-complete ()
  "Use TAB to call indent or counsel-company."
  (interactive)
  (if (looking-at "\\_>")
      (counsel-company)
    (indent-according-to-mode)))
(global-set-key (kbd "TAB") 'ric-indent-or-complete)
;; (setq company-idle-delay nil)           ;turn off auto-popup after idle
;; (setq company-frontends '())