(use-package ivy
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  (setq magit-completing-read-function 'ivy-completing-read)
  :bind (
         ;; ("<M-return>" . ivy-switch-buffer)
         ("C-x b" . ivy-switch-buffer)
         ("C-x B" . switch-to-buffer)   ;legacy
         ))

