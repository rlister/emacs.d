(use-package chruby
  :config
  (require 'cl)                         ;chruby uses mapcan and needs this
  (chruby "2.3.1")
  )