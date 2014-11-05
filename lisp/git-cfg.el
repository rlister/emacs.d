(setq magit-save-some-buffers nil)
(setq magit-completing-read-function 'magit-ido-completing-read)

(global-set-key (kbd "C-x g") 'magit-status) ;magit from melpa

(eval-after-load 'magit-mode
  '(progn
     (add-hook
      'magit-mode-hook
      (lambda ()
        (setq magit-save-some-buffers nil)      ;do not bug me about saving files on C-x g, esp. dirs
        ))))

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

(global-git-gutter-mode t)              ;git-gutter-fringe from melpa
(defalias 'gh 'git-link)                ;install git-link from melpa; push to kill-ring the current line/region in github
