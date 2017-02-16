(use-package chruby
  :ensure t                             ;cannot get this to lazy load properly
  :init
  (require 'cl)                         ;chruby uses mapcan and needs this
  (chruby "2.4.0")
  ;; (add-hook 'ruby-mode-hook 'chruby)
  )