(setq vterm-buffer-name-string "*vterm %s*") ;include shell title in buffer name
(setq vterm-max-scrollback 10000)
(setq vterm-copy-exclude-prompt t)    ;exclude prompt from copy in vterm-copy-mode-done
(setq vterm-keymap-exceptions
      '("C-," "C-." "C-t" "C-c" "C-x" "C-u" "C-g" "C-h" "C-l" "M-x" "M-o" "C-v" "M-v" "C-y" "M-y"))

(define-key vterm-mode-map (kbd "<M-return>") #'vterm-copy-mode)
(define-key vterm-mode-map (kbd "M-r") #'vterm-send-C-r)
(define-key vterm-mode-map (kbd "<C-backspace>") #'vterm-send-meta-backspace)
(define-key vterm-mode-map (kbd "M-h") #'ric/vterm-mark-last-output)
(define-key vterm-mode-map (kbd "<C-return>") #'ric/vterm-mark-last-output)
(define-key vterm-mode-map (kbd "M-v") #'(lambda () (interactive) (vterm-copy-mode) (scroll-down-command)))
(define-key vterm-mode-map (kbd "<C-up>") #'vterm-previous-prompt)
(define-key vterm-mode-map (kbd "<C-down>") #'vterm-next-prompt)

(defun ric/vterm-mark-last-output ()
  "Mark the last batch of output from a shell command."
  (interactive)
  (vterm-copy-mode)
  (beginning-of-line)
  (set-mark-command nil)
  (vterm-previous-prompt 1)
  (forward-line 1))
