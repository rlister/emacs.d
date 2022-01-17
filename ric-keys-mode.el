(define-minor-mode ric-keys-mode
  "Set up global bindings to override other modes."
  :lighter " rk"
  :init-value 1
  :global t
  :keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<C-tab>") #'hippie-expand)
    (define-key map (kbd "C-.") #'other-window)
    (define-key map (kbd "M-,") #'beginning-of-buffer)
    (define-key map (kbd "M-.") #'end-of-buffer)
    (define-key map (kbd "C-,") #'(lambda () (interactive) (other-window -1)))
    (define-key map (kbd "C-;") #'comment-or-uncomment-region)
    (define-key map (kbd "C-j") #'forward-whitespace)
    (define-key map (kbd "M-j") #'(lambda () (interactive) (forward-whitespace -1)))
    (define-key map (kbd "C-= C-=") #'tracking-next-buffer)
    (define-key map (kbd "C-= T") #'slack-all-threads)
    (define-key map (kbd "C-= c") #'slack-select-rooms)
    (define-key map (kbd "C-= g") #'slack-group-select)
    (define-key map (kbd "C-= i") #'slack-im-select)
    (define-key map (kbd "C-= u") #'slack-select-unread-rooms)
    (define-key map (kbd "M-\\") #'mark-sexp)
    (define-key map (kbd "C-c L") #'link-hint-copy-link)
    (define-key map (kbd "C-c c") #'org-capture)
    (define-key map (kbd "C-c d") #'ric/duplicate-line)
    (define-key map (kbd "C-c i") #'string-inflection-all-cycle)
    (define-key map (kbd "C-c j") #'avy-goto-word-1)
    (define-key map (kbd "C-c l") #'link-hint-open-link)
    (define-key map (kbd "C-c m") #'imenu)
    (define-key map (kbd "C-c o") #'org-agenda)
    (define-key map (kbd "C-c r") #'rg)
    (define-key map (kbd "C-c R") #'ric/code-review-link-hint)
    (define-key map (kbd "C-c t") #'vterm)
    (define-key map (kbd "C-c u") #'winner-undo)
    (define-key map (kbd "C-c y") #'browse-kill-ring)
    (define-key map (kbd "C-t") #'switch-to-buffer)
    (define-key map (kbd "C-x C-z") nil)
    (define-key map (kbd "C-x d") #'dired-jump)
    (define-key map (kbd "C-x g") #'magit-status)
    (define-key map (kbd "C-x k") #'kill-current-buffer)
    (define-key map (kbd "C-x m") #'execute-extended-command)
    (define-key map (kbd "C-z") #'zap-up-to-char)
    (define-key map (kbd "M-SPC") #'cycle-spacing)
    (define-key map (kbd "M-o") #'project-find-file)
    (define-key map (kbd "M-s r") #'anzu-query-replace)
    (define-key map (kbd "C-(") #'(lambda () (interactive) (re-search-forward "\\s(")))
    (define-key map (kbd "C-)") #'(lambda () (interactive) (re-search-forward "\\s)")))
    (define-key map (kbd "C-'") #'(lambda () (interactive) (re-search-forward "\\s\"")))
    (define-key map (kbd "<f2>") #'font-height-decrease)
    (define-key map (kbd "<f3>") #'font-height-increase)
    (define-key map (kbd "<f4>") #'font-height-reset)
    (define-key map (kbd "C-\\") #'mark-sexp)
    (define-key map (kbd "H-i") #'project-find-file)
    (define-key map (kbd "H-m") #'easy-kill)
    map)
  (keyboard-translate ?\C-i ?\H-i)
  (keyboard-translate ?\C-m ?\H-m)
  )

(provide 'ric-keys-mode)
