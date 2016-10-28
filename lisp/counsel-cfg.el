(use-package counsel
  :ensure t
  :init
  :bind (
         ("C-x m"   . counsel-M-x)
         ("C-x C-m" . counsel-M-x)
         ("M-y"     . counsel-yank-pop)
         ("C-h f"   . counsel-describe-function)
         ("C-h v"   . counsel-describe-variable)
         ("M-m"     . counsel-imenu)
         ("C-x C-f" . counsel-find-file)
         ("C-z M"   . counsel-projectile-switch-project)
         ("C-z b"   . counsel-projectile-switch-to-buffer)
         ("C-x f"   . counsel-projectile-find-file)
         ("C-z f"   . counsel-projectile-find-file)
         ("C-z C-f" . counsel-projectile-find-file)
         ))