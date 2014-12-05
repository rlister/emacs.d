(projectile-global-mode)
(setq projectile-remember-window-configs nil)

;; (global-set-key (kbd "C-z C-f") 'projectile-find-file)
;; (global-set-key (kbd "C-z f")   'projectile-find-file)
;; (global-set-key (kbd "C-z b")   'projectile-switch-to-buffer)
;; (global-set-key (kbd "C-z d")   'projectile-find-dir)
;; (global-set-key (kbd "C-z D")   'projectile-dired)
;; (global-set-key (kbd "C-z p")   'projectile-switch-project)

;; make a unique shell buffer for each project
(defun shell-dedicated-toggle-projectile ()
  "shell-dedicated-toggle with project-unique buffer name."
  (interactive)
  (shell-dedicated-toggle (format "*shell: %s*" (projectile-project-name))))

(global-set-key (kbd "M-.") 'shell-dedicated-toggle-projectile) ;since iterm eats C-,
