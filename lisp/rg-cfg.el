(use-package rg
  :ensure t
  :bind (
         :map global-map
         ("H-r" . rg)
         ("C-M-s-r" . rg)
         :map rg-mode-map
         ("e" . previous-error-no-select)
         )
  )