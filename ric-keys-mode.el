;;; ric-keys-mode.el --- minor mode to set keybindings

;; Version: 0

;;;###autoload
(defun ric-key-translations ()
  (when (display-graphic-p)
    (keyboard-translate ?\C-i ?\H-i)
    (keyboard-translate ?\C-m ?\H-m)))

;;;###autoload
(define-minor-mode ric-keys-mode
  "Set up global bindings to override other modes."
  :lighter " rk"
  :group 'keyboard
  :global t
  :init-value 1
  :keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<C-tab>") #'hippie-expand)
    (define-key map (kbd "<f2>") #'font-height-decrease)
    (define-key map (kbd "<f3>") #'font-height-increase)
    (define-key map (kbd "<f4>") #'font-height-reset)
    (define-key map (kbd "<insert>") #'kill-ring-save)
    (define-key map (kbd "C-'") #'ric-mark-string-forward)
    (define-key map (kbd "C-(") #'ric-mark-paren-backward)
    (define-key map (kbd "C-)") #'ric-mark-paren-forward)
    (define-key map (kbd "C-,") #'previous-buffer)
    (define-key map (kbd "C-.") #'next-buffer)
    (define-key map (kbd "C-;") #'comment-or-uncomment-region)
    (define-key map (kbd "C-= C-=") #'tracking-next-buffer)
    (define-key map (kbd "C-= T") #'slack-all-threads)
    (define-key map (kbd "C-= c") #'slack-select-rooms)
    (define-key map (kbd "C-= g") #'slack-group-select)
    (define-key map (kbd "C-= i") #'slack-im-select)
    (define-key map (kbd "C-= u") #'slack-select-unread-rooms)
    (define-key map (kbd "C-\\") #'mark-sexp)
    (define-key map (kbd "C-`") #'ric-mark-string-backward)
    (define-key map (kbd "C-c '") #'ruby-toggle-string-quotes)
    (define-key map (kbd "C-c I") #'mark-inside-backward-sexp)
    (define-key map (kbd "C-c L") #'link-hint-copy-link)
    (define-key map (kbd "C-c O") #'mark-backward-sexp)
    (define-key map (kbd "C-c R") #'ric-code-review-link-hint)
    (define-key map (kbd "C-c a") #'org-agenda)
    (define-key map (kbd "C-c b") #'project-switch-to-buffer)
    (define-key map (kbd "C-c c") #'org-capture)
    (define-key map (kbd "C-c d") #'ric-duplicate-line)
    (define-key map (kbd "C-c e") #'eshell)
    (define-key map (kbd "C-c i") #'string-inflection-all-cycle)
    (define-key map (kbd "C-c j") #'avy-goto-word-1)
    (define-key map (kbd "C-c k") #'kill-whole-line)
    (define-key map (kbd "C-c l") #'link-hint-open-link)
    (define-key map (kbd "C-c m") #'mu4e)
    (define-key map (kbd "C-c o") #'mark-forward-sexp)
    (define-key map (kbd "C-c r") #'rg)
    (define-key map (kbd "C-c t") #'vterm)
    (define-key map (kbd "C-c u") #'winner-undo)
    (define-key map (kbd "C-c y") #'browse-kill-ring)
    (define-key map (kbd "C-j") #'forward-whitespace)
    (define-key map (kbd "C-t") #'switch-to-buffer)
    (define-key map (kbd "C-x C-z") nil)
    (define-key map (kbd "C-x d") #'dired-jump)
    (define-key map (kbd "C-x g") #'magit-status)
    (define-key map (kbd "C-x k") #'kill-current-buffer)
    (define-key map (kbd "C-x m") #'execute-extended-command)
    (define-key map (kbd "C-z") #'zap-up-to-char)
    (define-key map (kbd "ESC <down>") #'end-of-buffer)
    (define-key map (kbd "ESC <up>") #'beginning-of-buffer)
    (define-key map (kbd "H-i") #'project-find-file)
    (define-key map (kbd "H-m") #'er/expand-region)
    (define-key map (kbd "M-<down>") #'end-of-buffer)
    (define-key map (kbd "M-<up>") #'beginning-of-buffer)
    (define-key map (kbd "M-Q") #'ric-unfill-paragraph)
    (define-key map (kbd "M-SPC") #'cycle-spacing)
    (define-key map (kbd "M-[") #'ric-mark-paren-backward)
    (define-key map (kbd "M-]") #'ric-mark-paren)
    (define-key map (kbd "M-i") #'imenu)
    (define-key map (kbd "M-o") #'project-find-file)
    (define-key map (kbd "M-s r") #'anzu-query-replace)
    (define-key map (kbd "s-<up>") #'enlarge-window)
    (define-key map (kbd "s-<down>") #'shrink-window)
    (define-key map (kbd "s-<right>") #'enlarge-window-horizontally)
    (define-key map (kbd "s-<left>") #'shrink-window-horizontally)
    map))

(provide 'ric-keys-mode)

;;; ric-keys-mode.el ends here
