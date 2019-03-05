(defvar ric-mode-line-project
  '(:eval (format "[%s]" (projectile-project-name)))
  "Mode line entry for projectile project name.")
(put 'ric-mode-line-project 'risky-local-variable t)

;; basically the default mode-line-format with few additions
(setq-default
 mode-line-format
 (list
  "%e"
  'mode-line-front-space
  'mode-line-mule-info
  'mode-line-client
  'mode-line-modified
  'mode-line-remote
  'mode-line-frame-identification
  'ric-mode-line-project
  " "
  'mode-line-buffer-identification
  "   "
  'mode-line-position
  '(vc-mode vc-mode)
  "  "
  'mode-line-modes
  'mode-line-misc-info
  'mode-line-end-spaces
  ))

;; time and load in mode-line
(display-time)