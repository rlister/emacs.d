(use-package term
  :bind (
         ;; bindings in line mode
         ("C-j" . ric/term-toggle)
         ("M-:" . eval-expression)
         )
  :config
  ;; bindings in char mode
  (define-key term-raw-map (kbd "C-j") 'ric/term-toggle)
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "M-y") 'ric/term-pop)

  (defadvice term-handle-exit
      (after term-kill-buffer-on-exit activate)
    "Kill term buffers on exiting term (C-d or `exit`)."
    (kill-buffer))

  (defun ric/term ()
    "Start term with my shell."
    (interactive)
    (ansi-term (getenv "SHELL")))

  (defun ric/term-toggle ()
    "Switch to appropriate evil states with term mode changes."
    (interactive)
    (if (term-in-line-mode)
        (progn
          (term-char-mode)
          (evil-emacs-state)
          ;; (with-current-buffer (current-buffer) (read-only-mode 0))
          (read-only-mode 0)
          (term-send-raw-string ""))    ;back to prompt
      (progn
        (term-line-mode)
        (evil-normal-state))))

  (defun ric/term-pop ()
    "Pass yank pop through as raw chars for char mode."
      (interactive)
      (term-send-raw-string (counsel-yank-pop)))
  )