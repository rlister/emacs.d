(projectile-global-mode)

(defun ric-projectile-switch-to-last-buffer ()
  "Switch to most recent file in project, to be called by projectile-switch-project-action."
  (interactive)
  (find-file (car (projectile-recentf-files))))

(setq
 projectile-switch-project-action 'projectile-dired
 ;; projectile-switch-project-action 'projectile-recentf
 ;; projectile-switch-project-action 'ric-projectile-switch-to-last-buffer
 projectile-remember-window-configs nil)

