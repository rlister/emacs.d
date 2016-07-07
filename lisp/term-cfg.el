;; install term-projectile (term-manager) from melpa

;; need to unbind C-z here in special way for evil
(eval-after-load "evil-maps"
  (dolist (map '(evil-motion-state-map
                 evil-insert-state-map
                 evil-emacs-state-map))
    (define-key (eval map) "\C-z" nil)))

(setq term-unbind-key-list '("C-z" "C-x"))

(defun ric-term-toggle-line-char-mode ()
  (interactive)
  (if (term-in-line-mode)
      (progn
        (term-char-mode)
        (evil-emacs-state))
    (progn
      (term-line-mode)
      (evil-normal-state))))

(defun ric-toggle-evil-state ()
  "My replacement for C-z to switch to emacs state, which is hard to re-bind."
  (interactive)
  (if (string= evil-state "emacs")
      (evil-normal-state)
    (evil-emacs-state)))

(global-set-key (kbd "C-z") nil) ;make C-z a prefix key in most modes
(global-set-key (kbd "C-z m") 'counsel-projectile)
(global-set-key (kbd "C-z l") 'evil-buffer)
(global-set-key (kbd "C-z b") 'counsel-projectile-switch-to-buffer)
(global-set-key (kbd "C-z f") 'counsel-projectile-find-file)
(global-set-key (kbd "C-z c") 'term-projectile-create-new) ;start a term from anywhere
(global-set-key (kbd "C-z n") 'term-projectile-backward)
(global-set-key (kbd "C-z p") 'term-projectile-forward)
(global-set-key (kbd "C-z [") 'ric-term-toggle-line-char-mode)
(global-set-key (kbd "C-z e") 'ric-toggle-evil-state)

(eval-after-load "term-mode"
  (add-hook 'term-mode-hook
            (lambda ()
              (define-key term-raw-map (kbd "C-y")   'term-paste) ;to make yank work properly
              (define-key term-raw-map (kbd "C-z")   nil)
              (define-key term-raw-map (kbd "C-x") nil) ;make prefix in term-mode
              (define-key term-raw-map (kbd "C-x m") 'counsel-M-x) ;term-mode is ignoring the global bind of this
              ;; (add-to-list 'term-bind-key-alist '("C-z z" . term-send-ctrl-z))
              )
            )
  )


(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)