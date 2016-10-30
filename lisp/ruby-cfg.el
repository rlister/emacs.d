(use-package ruby
  :defer t
  :init
  (add-hook 'ruby-mode-hook (lambda () (setq show-trailing-whitespace t)))
  )