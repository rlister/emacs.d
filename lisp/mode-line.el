(setq-default
 mode-line-format
 (list
  '(:eval evil-mode-line-tag)
  '(:eval (propertize (format "[%s]" (projectile-project-name))'face 'font-lock-type-face))
  " "
  '(:eval (propertize "%b" 'face 'mode-line-buffer-id))
  " " mode-line-modified " "
  '(:eval (propertize "%m" 'face 'font-lock-comment-face))
  )) 
