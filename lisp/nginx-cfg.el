(use-package nginx-mode
  :config
  (setq nginx-indent-level 2)
  (add-to-list 'auto-mode-alist
               '("config/nginx/.*" . nginx-mode))
  )