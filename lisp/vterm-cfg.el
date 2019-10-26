(use-package vterm
  :config
  (define-key vterm-mode-map (kbd "C-SPC") 'counsel-M-x)
  (define-key vterm-mode-map (kbd "C-j") 'other-window)
  (define-key vterm-mode-map (kbd "C-o") 'counsel-projectile-find-file)
  (define-key vterm-mode-map (kbd "M-y") 'ric/vterm-yank-pop)
  (define-key vterm-mode-map (kbd "H-l") 'vterm-copy-mode)
  (define-key vterm-copy-mode-map (kbd "H-l") 'vterm-copy-mode)
  (define-key global-map (kbd "H-t") 'vterm)
  )

(defun ric//vterm-copy-mode (orig-fun &rest args)
  "Change evil state when toggling vterm-copy-mode."
  (if vterm-copy-mode
      (evil-motion-state)
    (evil-emacs-state)))

(advice-add 'vterm-copy-mode :after #'ric//vterm-copy-mode)

(defun ric/vterm-yank-pop ()
  "Call my version of yank-pop and insert in vterm."
  (interactive)
  (let ((inhibit-read-only t))
    (vterm-send-string (counsel-yank-pop))))
