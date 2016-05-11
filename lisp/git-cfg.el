;; (setq magit-save-some-buffers nil)
;; (setq magit-completing-read-function 'magit-ido-completing-read)

;; (global-set-key (kbd "C-x g") 'magit-status) ;magit from melpa

;; this defaults to C-RET, but cannot bind that in terminal
;; (define-key magit-status-mode-map (kbd "M-RET") 'magit-show-commit)

(setq magit-last-seen-setup-instructions "1.4.0") ;stop warning from popping up
(setq magit-commit-show-diff nil)                 ;do not show diff (which is slow) on magit-commit (c c)
(setq magit-save-some-buffers nil)  ;do not bug me about saving files on C-x g, esp. dirs
(setq magit-push-always-verify nil) ;do not nag me about whether to push upstream

;; (eval-after-load 'magit-mode
;;   '(progn
;;      (add-hook
;;       'magit-mode-hook
;;       (lambda ()
;;         ))))

;; full screen magit-status from http://whattheemacsd.com/setup-magit.el-01.html
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

;; restore previously hidden windows
(defadvice magit-quit-window (around magit-restore-screen activate)
  ad-do-it
  (jump-to-register :magit-fullscreen))

;; (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

;; keybindings for magit-blame minor mode
(evil-define-key 'normal magit-blame-mode-map (kbd "q") 'magit-blame-quit)
(evil-define-key 'normal magit-blame-mode-map (kbd "RET") 'magit-show-commit)

;; (add-hook 'magit-blame-mode-hook
;;           '(lambda ()
;;              (evil-normalize-keymaps)))

(global-git-gutter-mode t)              ;git-gutter-fringe from melpa
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

;; fix git-timemachine keys in evil
;; see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))