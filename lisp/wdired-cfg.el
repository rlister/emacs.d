(use-package wdired
  :commands dired-toggle-read-only
  :bind (:map dired-mode-map
        ("e" . dired-toggle-read-only)
        )
  )