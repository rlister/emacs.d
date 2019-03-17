;; use C-h as backspace as the unix gods intended, use F1 for help prefix
(use-package help
  :config
  (define-key key-translation-map [?\C-h] [?\C-?])
  )
