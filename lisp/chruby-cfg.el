;;chruby uses mapcan and needs this
(require 'cl)

(use-package chruby
  :config
  (chruby "2.3.1")
  )