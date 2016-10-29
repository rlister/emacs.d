(use-package counsel-projectile
  :ensure t
  :bind (
         ("C-z M"   . counsel-projectile-switch-project)
         ("C-z b"   . counsel-projectile-switch-to-buffer)
         ("C-x f"   . counsel-projectile-find-file)
         ("C-z f"   . counsel-projectile-find-file)
         ("C-z C-f" . counsel-projectile-find-file)
         ))
