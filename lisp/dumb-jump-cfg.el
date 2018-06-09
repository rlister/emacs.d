(use-package dumb-jump
  :ensure t
  :init
  (setq dumb-jump-selector 'ivy)
  :bind (("C-]" . dumb-jump-go)      ;was evil-jump-to-tag
         ("M-]" . dumb-jump-go)
         ("M-g j" . dumb-jump-go)
         ))