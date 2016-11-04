(use-package autorevert
  :diminish auto-revert-mode
  :init
  (setq auto-revert-check-vc-info nil) ;update git branch in modeline after all changes
  )