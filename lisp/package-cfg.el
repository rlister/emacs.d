(require 'package)
(setq use-package-minimum-reported-time 0)
(setq use-package-verbose t)

;; use melpa
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.milkbox.net/packages/")
 t)