(use-package counsel-projectile
  :ensure t
  :init
  (setq counsel-projectile-remove-current-project t)
  (setq counsel-projectile-remove-current-buffer t)
  (define-key counsel-projectile-switch-to-buffer-map (kbd "C-k") 'ivy-previous-line)
  :bind (
         ("C-x p"      . (lambda () (interactive) (counsel-projectile-switch-project "D")))
         ("C-,"        . (lambda () (interactive) (counsel-projectile-switch-project "D")))
         ("M-,"        . (lambda () (interactive) (counsel-projectile-switch-project "D")))
         ("C-<return>" . switch-to-buffer)
         ("C-o"        . counsel-projectile-find-file)
         ("C-x C-d"    . counsel-projectile-find-dir)
         ))