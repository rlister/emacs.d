;; (setq magit-save-some-buffers nil)
;; (setq magit-completing-read-function 'magit-ido-completing-read)

;; this defaults to C-RET, but cannot bind that in terminal
;; (define-key magit-status-mode-map (kbd "M-RET") 'magit-show-commit)

;; (defun magit-quit-session ()
;;   "Restores the previous window configuration and kills the magit buffer"
;;   (interactive)
;;   (kill-buffer)
;;   (jump-to-register :magit-fullscreen))

;; restore previously hidden windows
;; (defadvice magit-quit-window (around magit-restore-screen activate)
;;   ad-do-it
;;   (jump-to-register :magit-fullscreen))

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