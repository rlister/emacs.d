(use-package chruby
  :ensure t                             ;cannot get this to lazy load properly
  :init
  (require 'cl)                         ;chruby uses mapcan and needs this
  (chruby "2.5.3")
  ;; (add-hook 'ruby-mode-hook 'chruby)
  )