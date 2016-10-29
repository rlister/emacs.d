(use-package simple
  :config
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  :bind
  ("C-m" . newline-and-indent) ;make RET indent
  )