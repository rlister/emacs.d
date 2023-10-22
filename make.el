(defconst remote-packages
  '(anzu
    avy
    ;; code-review
    diff-hl
    dockerfile-mode
    ;; dumb-jump
    ;; easy-kill
    ;; eglot
    elfeed
    forge
    git-link
    git-timemachine
    link-hint
    magit
    nginx-mode
    orderless
    org-present
    rainbow-mode
    selected
    ;; string-inflection
    vertico
    ;; visible-mark
    vterm
    yaml-mode)
  "Packages to install.")

(defconst local-packages
  '(ric-lib
    min-theme
    no-mouse-mode)
  "Local packages to install.")

(defconst vc-packages
  '("https://github.com/zerolfx/copilot.el")
  "Local packages to install.")

;; setup package.el
(package-initialize)

(defun install-remote ()
  "Install packages from remote archives."
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents)
  (dolist (package remote-packages)
    (unless (package-installed-p package)
      (package-install package)))
  (print package-activated-list))

(defun install-local ()
  "Install packages from local files."
  (dolist (file local-packages)
    (package-install-file (format "%s.el" file))))

(defun install-vc ()
  "Install packages from version control."
  (dolist (repo vc-packages)
    (package-vc-install repo)))
