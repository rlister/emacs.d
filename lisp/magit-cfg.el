(use-package magit
  :ensure t
  :bind (
         :map global-map
         ("C-x g" . magit-status)
         ("H-g" . magit-status)
         ("C-M-s-g" . magit-status)
         :map magit-mode-map            ;parent inherited by other maps
         ("e" . magit-section-backward)
         )
  :config
  (setq magit-last-seen-setup-instructions "1.4.0") ;stop warning from popping up
  (setq magit-commit-show-diff nil)                 ;do not show diff (which is slow) on magit-commit (c c)
  (setq magit-save-some-buffers nil)  ;do not bug me about saving files on C-x g, esp. dirs
  (setq magit-push-always-verify nil) ;do not nag me about whether to push upstream
  (setq git-commit-summary-max-length 72) ;stop bugging me about long commit msgs

  ;; aliases like cmdline
  ;; (defalias 'g     'magit-status)
  ;; (defalias 'blame 'magit-blame)
  ;; (defalias 'gco   'magit-checkout)
  ;; (defalias 'gb    'magit-branch)
  ;; (defalias 'gm    'magit-merge)
  ;; (defalias 'gu    'ric/magit-git-up)
  ;; (defalias 'gp    'magit-push-current-to-upstream)
  ;; (defalias 'gbco  'magit-branch-and-checkout)

  ;; full screen magit-status from http://whattheemacsd.com/setup-magit.el-01.html
  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))
  )

  ;; (defun ric/magit-git-up ()
  ;;   "Do a git pull with rebase and autostash, like git-up."
  ;;   (interactive)
  ;;   (run-hooks 'magit-credential-hook)
  ;;   (magit-run-git-with-editor "pull" "--rebase" "--autostash"))
  ;; )