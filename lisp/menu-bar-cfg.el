(use-package menu-bar
  :config
  (menu-bar-mode -1)
  :bind
  ("C-x k" . kill-this-buffer) ;changed from kill-buffer
  ("H-k"   . kill-this-buffer)
  ("C-M-s-k" . kill-this-buffer)
  )