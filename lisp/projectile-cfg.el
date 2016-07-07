(projectile-global-mode)

(defun ric-projectile-switch-to-last-buffer ()
  "Switch to most recent file in project, to be called by projectile-switch-project-action."
  (interactive)
  (find-file (car (projectile-recentf-files))))

(setq
 ;; projectile-switch-project-action 'projectile-dired
 ;; projectile-switch-project-action 'projectile-recentf
 projectile-switch-project-action 'ric-projectile-switch-to-last-buffer
 projectile-remember-window-configs nil)

;; make a unique shell buffer for each project
;; (defun shell-dedicated-toggle-projectile ()
;;   "shell-dedicated-toggle with project-unique buffer name."
;;   (interactive)
;;   (shell-dedicated-toggle (format "*shell: %s*" (projectile-project-name))))

;; (global-set-key (kbd "M-.") 'shell-dedicated-toggle-projectile) ;since iterm eats C-,