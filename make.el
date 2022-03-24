(defconst remote-packages
  '(anzu
    avy
    bbdb-vcard
    code-review
    dockerfile-mode
    dumb-jump
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
    string-inflection
    vertico
    visible-mark
    vterm)
  "Packages to install.")

(defconst local-packages
  '(ric-lib
    font-height)
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
