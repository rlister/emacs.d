(use-package ivy-rich
  :ensure t
  :init
  (setq ivy-format-function #'ivy-format-function-line)
  :config
  (ivy-rich-mode 1)
  )
