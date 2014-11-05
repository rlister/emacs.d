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

(global-git-gutter-mode t)              ;git-gutter-fringe from melpa
(defalias 'gh 'git-link)                ;install git-link from melpa; push to kill-ring the current line/region in github
