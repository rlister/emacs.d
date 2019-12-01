(use-package which-key
  :ensure t
  :bind (
         :map global-map
         ("C-c k" . which-key-show-major-mode)
         ("C-c K" . which-key-show-top-level)
        )
  )