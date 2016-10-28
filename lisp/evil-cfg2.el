;;; -*- lexical-binding: t -*-

(defun ric-evil-undefine ()
  "Stop evil from ruining emacs smart tab behaviour."
  (let (evil-mode-map-alist)
    (call-interactively (key-binding (this-command-keys)))))

(defun ric-evil-bindings ()
  "Hacky way to setup all the keybindings."
  (define-key evil-normal-state-map "\C-e" 'mwim-end-of-code-or-line)
  (define-key evil-insert-state-map "\C-e" 'mwim-end-of-code-or-line)
  (define-key evil-visual-state-map "\C-e" 'mwim-end-of-code-or-line)
  (define-key evil-motion-state-map "\C-e" 'mwim-end-of-code-or-line)
  (define-key evil-insert-state-map "\C-f" 'evil-forward-char)
  (define-key evil-insert-state-map "\C-b" 'evil-backward-char)
  (define-key evil-insert-state-map "\C-d" 'evil-delete-char)
  (define-key evil-insert-state-map "\C-n" 'evil-next-line)
  (define-key evil-insert-state-map "\C-p" 'evil-previous-line)
  (define-key evil-insert-state-map "\C-w" 'evil-delete)
  (define-key evil-insert-state-map "\C-y" 'yank)
  (define-key evil-normal-state-map "\C-k" 'kill-line)
  (define-key evil-insert-state-map "\C-k" 'kill-line)
  (define-key evil-visual-state-map "\C-k" 'kill-line)
  (define-key evil-normal-state-map "\M-y" 'counsel-yank-pop)
  (define-key evil-insert-state-map "\M-y" 'counsel-yank-pop)
  (define-key evil-visual-state-map "\M-y" 'counsel-yank-pop)
  (define-key evil-normal-state-map (kbd "TAB") 'ric-evil-undefine)
  )

(defun set-evil-mode-line-face ()
  "Change mode-line faces based on evil state."
  (let ((color
         (cond
          ((evil-normal-state-p)  (cons nil "palegreen"))
          ((evil-insert-state-p)  (cons nil "indianred"))
          ((evil-visual-state-p)  (cons nil "goldenrod"))
          ((evil-replace-state-p) (cons nil "lightcoral"))
          ((evil-motion-state-p)  (cons nil "royalblue"))
          ((evil-emacs-state-p)   (cons nil "cadetblue"))
          ((buffer-modified-p)    (cons "#006fa0" "#ffffff"))
          (t                      (cons nil "gray")))))
    (set-face-foreground 'mode-line (cdr color))
    ))

(use-package evil
  :config
  (evil-mode 1)
  (ric-evil-bindings)
  (evil-set-initial-state 'package-menu-mode 'motion)
  (evil-set-initial-state 'org-agenda-mode   'motion)
  (evil-set-initial-state 'help-mode 'motion)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-set-initial-state 'ivy-occur-mode 'emacs)
  (evil-set-initial-state 'occur-mode 'motion)
  (evil-define-key 'motion org-agenda-mode-map (kbd "j") 'org-agenda-next-line)
  (evil-define-key 'motion org-agenda-mode-map (kbd "k") 'org-agenda-previous-line)
  (evil-define-key 'motion org-agenda-mode-map (kbd "TAB") 'org-agenda-goto)
  (evil-define-key 'motion org-agenda-mode-map (kbd "F") 'org-agenda-follow-mode)
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
  (add-hook 'post-command-hook 'set-evil-mode-line-face)
  ;; need to unbind C-z here in special way for evil
  (eval-after-load "evil-maps"
    (dolist (map '(evil-motion-state-map
                   evil-insert-state-map
                   evil-emacs-state-map))
      (define-key (eval map) "\C-z" nil)))
  )