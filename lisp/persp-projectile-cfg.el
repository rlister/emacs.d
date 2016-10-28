(use-package persp-projectile
  :ensure t
  :config
  (persp-mode)
  :bind
  ("C-z m" . projectile-persp-switch-project)
  )