(use-package ag
  :ensure t
  :config
  (setq ag-executable "/usr/local/bin/ag")
  (setq ag-highlight-search t)
  (setq ag-reuse-window t)
  :bind ("M-SPC" . ag-project)
  )