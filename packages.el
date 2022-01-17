(defconst ric/packages
  '(anzu
    avy
    bbdb-vcard
    code-review
    dockerfile-mode
    easy-kill
    elfeed
    forge
    git-link
    git-timemachine
    link-hint
    magit
    marginalia
    nginx-mode
    orderless
    org-present
    rainbow-mode
    slack
    vertico
    visible-mark
    vterm)
  "Packages to install.")

;; setup package.el
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)

;; install any missing packages
(dolist (package ric/packages)
  (unless (package-installed-p package)
    (package-install package)))

(print package-activated-list)
