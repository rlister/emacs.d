(use-package counsel-projectile
  :ensure t
  :init
  (setq counsel-projectile-remove-current-project t)
  (setq counsel-projectile-remove-current-buffer t)
  :bind (
         ("C-x p"      . (lambda () (interactive) (counsel-projectile-switch-project "D")))
         ("M-,"        . (lambda () (interactive) (counsel-projectile-switch-project "D")))
         ("C-x <return>" . counsel-projectile-switch-to-buffer)
         ("<M-return>" . counsel-projectile-switch-to-buffer)
         ([C-return]   . counsel-projectile-find-file)
         ("C-x C-d"    . counsel-projectile-find-dir)
         ))