(projectile-global-mode)

(setq
 projectile-switch-project-action 'projectile-dired ;when switching project land on top-level dired
 projectile-remember-window-configs nil)

;; make a unique shell buffer for each project
(defun shell-dedicated-toggle-projectile ()
  "shell-dedicated-toggle with project-unique buffer name."
  (interactive)
  (shell-dedicated-toggle (format "*shell: %s*" (projectile-project-name))))

(global-set-key (kbd "M-.") 'shell-dedicated-toggle-projectile) ;since iterm eats C-,