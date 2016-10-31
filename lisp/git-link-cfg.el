(use-package git-link)

;; (defalias 'gh 'git-link)                ;install git-link from melpa; push to kill-ring the current line/region in github

;; workaround until my pull-request is merged:
;; https://github.com/sshaw/git-link/pull/19
;; (require 'git-link)
;; (defun git-link-new (link)
;;   ;(message (kill-new link))
;;   (kill-new link)
;;   (message link)
;;   (setq deactivate-mark t)
;;   (when git-link-open-in-browser
;;     (browse-url link)))
