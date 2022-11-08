(defconst remote-packages
  '(anzu
    avy
    code-review
    corfu
    dockerfile-mode
    dumb-jump
    easy-kill
    eglot
    elfeed
    forge
    git-link
    git-timemachine
    link-hint
    magit
    marginalia
    nginx-mode
    org-present
    rainbow-mode
    string-inflection
    visible-mark
    vterm
    yaml-mode)
  "Packages to install.")

(defconst local-packages
  '(ric-lib
    font-height
    min-theme
    no-mouse-mode)
  "Local packages to install.")

;; setup package.el
(package-initialize)

;; install any missing packages
(defun install-remote ()
  "Install packages from remote archives."
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents)
  (dolist (package remote-packages)
    (unless (package-installed-p package)
      (package-install package)))
  (print package-activated-list))

;; install local packages from files
(defun install-local ()
  "Install packages from local files."
  (dolist (file local-packages)
    (package-install-file (format "%s.el" file))))
