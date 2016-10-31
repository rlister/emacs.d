(use-package wdired
  :bind (:map dired-mode-map
        ("e" . dired-toggle-read-only)
        )
  )