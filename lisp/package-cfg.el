;; separate packages by emacs version, because byte-compiling can break across versions
(setq package-user-dir
      (concat
       (file-name-as-directory user-emacs-directory)
       "elpa/" emacs-version))

;; bootstrap package so use-package can use it for everything else
(require 'package)
(setq use-package-minimum-reported-time 0)
(setq use-package-verbose t)

;; use melpa
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.milkbox.net/packages/") t)

(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))