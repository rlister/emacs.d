(use-package term
  :bind (
         ;; bindings in line mode
         ("M-:" . eval-expression)
         ("C-j" . other-window)
         ("C-k" . prev-window)
         ("C-o" . counsel-projectile-find-file)
         )
  :config
  ;; bindings in char mode
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "M-y") 'ric/term-pop)
  (define-key term-raw-map (kbd "C-j") 'other-window)
  (define-key term-raw-map (kbd "C-k") 'prev-window)
  (define-key term-raw-map (kbd "C-o") 'counsel-projectile-find-file)

  (defadvice term-handle-exit
      (after term-kill-buffer-on-exit activate)
    "Kill term buffers on exiting term (C-d or `exit`)."
    (kill-buffer))

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

(defun ric/term ()
  "Start term with my shell."
  (interactive)
  (ansi-term (getenv "SHELL")))

(define-key global-map   (kbd "<C-M-return>") 'ric/term)
