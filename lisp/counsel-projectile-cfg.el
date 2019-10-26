(use-package counsel-projectile
  :ensure t
  :init
  (setq counsel-projectile-remove-current-project t)
  (setq counsel-projectile-remove-current-buffer t)
  :config
  (define-key counsel-projectile-switch-to-buffer-map (kbd "C-k") 'ivy-previous-line)
  :bind (
         ("C-x p"      . ric/switch-project)
         ("H-p"        . ric/switch-project)
         ("C-,"        . ric/switch-project)
         ("C-<return>" . switch-to-buffer)
         ("C-o"        . counsel-projectile-find-file)
         ("C-x C-d"    . counsel-projectile-find-dir)
         ))

(defun ric/switch-project ()
  "Switch to project and open dired at git home."
  (interactive)
  (counsel-projectile-switch-project "D")
  )