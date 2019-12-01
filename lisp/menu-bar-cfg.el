(use-package menu-bar
  :config
  (menu-bar-mode -1)
  :bind
  ("C-x k" .   kill-current-buffer) ;changed from kill-this-buffer
  ("H-k"   .   kill-current-buffer)
  ("C-M-s-k" . kill-current-buffer)
  )