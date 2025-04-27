(defconst remote-packages
  '(anzu
    dockerfile-mode
    elfeed
    forge
    git-link
    link-hint
    magit
    nginx-mode
    orderless
    selected
    vertico
    vterm
    yaml-mode)
  "Packages to install.")

(defconst local-packages
  '(min-theme
    no-mouse-mode)
  "Local packages to install.")

(defconst vc-packages
  '("https://git.sr.ht/~sebasmonia/confluence-reader.el"
    "https://github.com/doomelpa/code-review"
    "https://github.com/zerolfx/copilot.el")
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
