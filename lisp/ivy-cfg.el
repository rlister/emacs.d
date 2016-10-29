(use-package ivy
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  (setq magit-completing-read-function 'ivy-completing-read)
  :bind (
         ("C-x b" . ivy-switch-buffer)
         ("C-x B" . switch-to-buffer)   ;legacy
         ))

;; (defun ric-indent-or-complete ()
;;   "Use TAB to call indent or counsel-company."
;;   (interactive)
;;   (if (looking-at "\\_>")
;;       (counsel-company)
;;     (indent-according-to-mode)))
;; (global-set-key (kbd "TAB") 'ric-indent-or-complete)
;; ;; (setq company-idle-delay nil)           ;turn off auto-popup after idle
;; ;; (setq company-frontends '())