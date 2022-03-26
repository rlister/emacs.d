(setq vterm-buffer-name-string "*vterm %s*") ;include shell title in buffer name
(setq vterm-copy-exclude-prompt t) ;exclude prompt from copy in vterm-copy-mode-done
(setq vterm-keymap-exceptions '("C-," "C-." "C-t" "C-c" "C-x" "C-u" "C-g" "C-h" "C-l" "M-x" "M-o" "C-v" "M-v" "C-y" "M-y"))
(setq vterm-max-scrollback 10000)
(setq vterm-shell "screen")

(define-key vterm-mode-map (kbd "<C-backspace>") #'vterm-send-meta-backspace)
(define-key vterm-mode-map (kbd "<C-return>") #'vterm-copy-mode)
(define-key vterm-mode-map (kbd "<C-up>") #'vterm-previous-prompt)
(define-key vterm-mode-map (kbd "<C-down>") #'vterm-next-prompt)
(define-key vterm-mode-map (kbd "C-z") #'vterm--self-insert)
(define-key vterm-mode-map (kbd "M-r") #'vterm-send-C-r)
(define-key vterm-mode-map (kbd "M-v") (lambda () (interactive) (vterm-copy-mode) (scroll-down-command)))

(define-key vterm-copy-mode-map (kbd "<C-return>") #'vterm-copy-mode)
(define-key vterm-copy-mode-map (kbd "<C-up>") #'vterm-previous-prompt)
(define-key vterm-copy-mode-map (kbd "<C-down>") #'vterm-next-prompt)
