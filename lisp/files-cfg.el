(use-package files
  :config
  (setq require-final-newline nil)      ;allow save if does not end with a newline
  (setq mode-require-final-newline nil) ;stop some modes from setting require-final-newline t
  (setq make-backup-files nil)          ;do not make ~ backup files
  (defun rb ()
    "Reload buffer after file has changed."
    (interactive)
    (revert-buffer t t t))
  )