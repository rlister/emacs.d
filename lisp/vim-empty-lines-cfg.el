;; show empty lines with tilde
(use-package vim-empty-lines-mode
  :ensure t
  :config
  (global-vim-empty-lines-mode 0)
  (add-hook 'prog-mode-hook 'vim-empty-lines-mode)
  (add-hook 'ruby-mode-hook 'vim-empty-lines-mode)
  )