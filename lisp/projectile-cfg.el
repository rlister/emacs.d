;; (defun ric-projectile-switch-to-last-buffer ()
;;   "Switch to most recent file in project, to be called by projectile-switch-project-action."
;;   (interactive)
;;   (find-file (car (projectile-recentf-files))))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-remember-window-configs nil)
  ;; projectile-switch-project-action 'projectile-recentf
  ;; projectile-switch-project-action 'ric-projectile-switch-to-last-buffer
  )