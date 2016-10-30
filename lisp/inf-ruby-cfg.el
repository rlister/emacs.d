(use-package inf-ruby
  :defer t
  :config
  (defalias 'irb 'inf-ruby)
  (defalias 'console 'inf-ruby-console-auto)
  (defun pry ()
    (interactive)
    (inf-ruby "pry"))
  )