(use-package avy
  :ensure t
  :init
  (setq avy-background t)         ; gray background
  (setq avy-all-windows nil)      ; should just show candidates from current window
  (setq avy-case-fold-search nil) ; do not ignore case
  (setq avy-keys (number-sequence ?a ?z))
  )