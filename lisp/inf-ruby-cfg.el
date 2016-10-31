(use-package inf-ruby
  :ensure t
  :config
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
  (defalias 'irb 'inf-ruby)
  (defalias 'console 'inf-ruby-console-auto)
  (defun pry ()
    (interactive)
    (inf-ruby "pry"))
  )