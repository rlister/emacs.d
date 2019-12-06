;;; -*- lexical-binding: t -*-

(defun ric/evil-undefine ()
  "Stop evil from ruining emacs smart tab behaviour."
  (interactive)
  (let (evil-mode-map-alist)
    (call-interactively (key-binding (this-command-keys)))))

(defun ric--evil-bindings ()
  "Hacky way to setup all the keybindings."
  (define-key evil-normal-state-map "n" 'evil-next-line)
  (define-key evil-normal-state-map "e" 'evil-previous-line)
  (define-key evil-motion-state-map "n" 'evil-next-line)
  (define-key evil-motion-state-map "e" 'evil-previous-line)
  (define-key evil-normal-state-map "\C-e" 'mwim-end-of-code-or-line)
  (define-key evil-insert-state-map "\C-e" 'mwim-end-of-code-or-line)
  (define-key evil-visual-state-map "\C-e" 'mwim-end-of-code-or-line)
  (define-key evil-motion-state-map "\C-e" 'mwim-end-of-code-or-line)
  (define-key evil-normal-state-map "\C-o" 'counsel-projectile-find-file)
  (define-key evil-insert-state-map "\C-o" 'counsel-projectile-find-file)
  (define-key evil-visual-state-map "\C-o" 'counsel-projectile-find-file)
  (define-key evil-motion-state-map "\C-o" 'counsel-projectile-find-file)
  (define-key evil-insert-state-map "\C-f" 'evil-forward-char)
  (define-key evil-insert-state-map "\C-b" 'evil-backward-char)
  (define-key evil-insert-state-map "\C-d" 'evil-delete-char)
  (define-key evil-insert-state-map "\C-n" 'evil-next-line)
  (define-key evil-insert-state-map "\C-p" 'evil-previous-line)
  (define-key evil-insert-state-map "\C-w" 'evil-delete)
  (define-key evil-insert-state-map "\C-y" 'yank)
  ;; (define-key evil-normal-state-map "\C-k" 'switch-to-buffer)
  ;; (define-key evil-insert-state-map "\C-k" 'switch-to-buffer)
  ;; (define-key evil-visual-state-map "\C-k" 'switch-to-buffer)
  (define-key evil-normal-state-map "\M-y" 'counsel-yank-pop)
  (define-key evil-insert-state-map "\M-y" 'counsel-yank-pop)
  (define-key evil-visual-state-map "\M-y" 'counsel-yank-pop)
  (define-key evil-normal-state-map "f" 'avy-goto-word-1)
  (define-key evil-normal-state-map (kbd "TAB") 'ric/evil-undefine)
  )

(defun ric/set-evil-mode-line-face ()
  "Change mode-line faces based on evil state."
  (let ((color
         (cond
          ((evil-normal-state-p)  (cons nil "LimeGreen"))
          ((evil-insert-state-p)  (cons nil "IndianRed"))
          ((evil-visual-state-p)  (cons nil "goldenrod"))
          ((evil-replace-state-p) (cons nil "LightCoral"))
          ((evil-motion-state-p)  (cons nil "RoyalBlue"))
          ((evil-emacs-state-p)   (cons nil "CadetBlue"))
          ((buffer-modified-p)    (cons "#006fa0" "#ffffff"))
          (t                      (cons nil "gray")))))
    (set-face-foreground 'mode-line (cdr color))
    ))

(use-package evil
  :ensure t
  :diminish undo-tree-mode
  :config
  (evil-mode 1)
  (ric--evil-bindings)
  (evil-set-initial-state 'package-menu-mode 'emacs)
  (evil-set-initial-state 'help-mode 'motion)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-set-initial-state 'vterm-mode 'emacs)
  (evil-set-initial-state 'vterm-copy-mode 'motion)
  (evil-set-initial-state 'ivy-occur-mode 'emacs)
  (evil-set-initial-state 'inf-ruby-mode 'emacs)
  (evil-set-initial-state 'shell-mode 'emacs)
  (evil-set-initial-state 'occur-mode 'motion)
  (evil-set-initial-state 'git-timemachine-mode 'motion)
  (evil-set-initial-state 'Man-mode 'motion)
  (evil-set-initial-state 'eww-mode 'motion)
  (evil-set-initial-state 'eww-bookmark-mode 'motion)

  (evil-define-key 'motion occur-mode-map (kbd "RET") 'occur-mode-goto-occurrence-other-window)
  (evil-define-key 'motion occur-mode-map (kbd "g") 'revert-buffer)
  (evil-define-key 'normal help-map "q" 'quit-window)
  (evil-define-key 'normal magit-blame-mode-map (kbd "q") 'magit-blame-quit)
  (evil-define-key 'normal magit-blame-mode-map (kbd "RET") 'magit-show-commit)
  (setq evil-visual-state-cursor '("RoyalBlue" box)); █
  (setq evil-insert-state-cursor '("IndianRed" bar)); ⎸
  (setq evil-emacs-state-cursor  '("LimeGreen" bar)); ⎸
  (setq evil-normal-state-cursor '("LimeGreen" hbar)); _
  (setq evil-motion-state-cursor '("RoyalBlue" hbar)); _
  (add-hook 'post-command-hook 'ric/set-evil-mode-line-face)
  ;; need to unbind C-z here in special way for evil
  (eval-after-load "evil-maps"
    (dolist (map '(evil-motion-state-map
                   evil-insert-state-map
                   evil-emacs-state-map))
      (define-key (eval map) "\C-z" nil)))
  )