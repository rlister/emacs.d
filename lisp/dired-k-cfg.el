;; git info in dired buffers
(use-package dired-k
  :init
  (add-hook 'dired-initial-position-hook 'dired-k)
  (add-hook 'dired-after-readin-hook #'dired-k-no-revert)
  (setq dired-k-human-readable t)
  :init
  :bind (
         :map dired-mode-map
         ("C-c C-k" . dired-k)
         ("K" . dired-k)                ;may not work?
         )
  :config
  (setq dired-k-style 'git)
  (setq dired-k-padding 1)
  )