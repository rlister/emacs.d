(use-package git-timemachine
  :ensure t
  :config
  ;; fix git-timemachine keys in evil
  ;; see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  ;; force update evil keymaps after git-timemachine-mode loaded
  (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)
  )