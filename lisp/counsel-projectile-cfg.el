(use-package counsel-projectile
  :ensure t
  :init
  (setq counsel-projectile-remove-current-project t)
  (setq counsel-projectile-remove-current-buffer t)
  :bind (
         ("M-,"        . counsel-projectile-switch-project)
         ("C-z m"      . counsel-projectile-switch-project)
         ("C-z M"      . counsel-projectile-switch-project)
         ("C-z b"      . counsel-projectile-switch-to-buffer)
         ("<M-return>" . counsel-projectile-switch-to-buffer)
         ([C-return]   . counsel-projectile-find-file)
         ("C-x f"      . counsel-projectile-find-file)
         ("C-z f"      . counsel-projectile-find-file)
         ("C-z C-f"    . counsel-projectile-find-file)
         ("C-z d"      . counsel-projectile-find-dir)
         ))