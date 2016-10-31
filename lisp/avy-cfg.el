(use-package avy
  :init
  (setq avy-background t)         ; gray background
  (setq avy-all-windows nil)      ; should just show candidates from current window
  (setq avy-case-fold-search nil) ; do not ignore case
  (setq avy-keys (number-sequence ?a ?z))
  :bind ("C-j" . avy-goto-word-1)
  )