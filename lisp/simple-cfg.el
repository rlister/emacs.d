(use-package simple
  :config
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  )