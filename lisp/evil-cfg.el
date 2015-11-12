;;; -*- lexical-binding: t -*-

;; evil-leader has to do a little dance to load properly
(require 'evil-leader)
(setq evil-leader/in-all-states t)
(evil-leader/set-leader "<SPC>")
(evil-mode nil) ;; no idea
(global-evil-leader-mode)
(evil-mode 1)

;; match all the things on %, install evil-matchit from melpa
(global-evil-matchit-mode 1)

;; highlights unique chars on f/F/t/T, install from melpa
(global-evil-quickscope-mode 1)

;; override mode-line face by evil state
(defun set-evil-mode-line-face ()
  (let ((color (cond
                ((evil-normal-state-p)  (cons nil "PaleGreen"))
                ((evil-insert-state-p)  (cons nil "IndianRed"))
                ((evil-visual-state-p)  (cons nil "GoldenRod"))
                ((evil-replace-state-p) (cons nil "LightCoral"))
                ((evil-motion-state-p)  (cons nil "RoyalBlue"))
                ((evil-emacs-state-p)   (cons nil "CadetBlue"))
                ((buffer-modified-p)    (cons "#006fa0" "#ffffff"))
                (t                      (cons nil "Gray")))))
    (set-face-foreground 'mode-line (cdr color))
    ))

(add-hook 'post-command-hook 'set-evil-mode-line-face)

;; switch back to normal state automatically when idling in other states
(defun switch-to-evil-normal-state ()
  (interactive)
  (if (string= evil-state "insert")
      (progn
        (evil-normal-state)
        (set-evil-mode-line-face)
        (message "Idled to normal state")
        )))
(run-with-idle-timer 10 t 'switch-to-evil-normal-state)

;; end-of-code or line not working with evil-mode so use
;; mwim from melpa
(autoload 'mwim-beginning-of-code-or-line "mwim" nil t)
(autoload 'mwim-end-of-code-or-line "mwim" nil t)
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(define-key evil-normal-state-map "\C-e" 'mwim-end-of-code-or-line)
(define-key evil-insert-state-map "\C-e" 'mwim-end-of-code-or-line)
(define-key evil-visual-state-map "\C-e" 'mwim-end-of-code-or-line)
(define-key evil-motion-state-map "\C-e" 'mwim-end-of-code-or-line)

;; other emacs keys in insert state
;;(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
;;(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
;;(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
;;(define-key evil-normal-state-map "\C-d" 'evil-delete-char)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
;;(define-key evil-visual-state-map "\C-d" 'evil-delete-char)
;;(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
;;(define-key evil-visual-state-map "\C-n" 'evil-next-line)
;;(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
;;(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
;;(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
;;(define-key evil-visual-state-map "\C-w" 'evil-delete)
;;(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
;;(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)
;;(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
;;(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)
(define-key evil-normal-state-map "\M-y" 'helm-show-kill-ring)
(define-key evil-insert-state-map "\M-y" 'helm-show-kill-ring)
(define-key evil-visual-state-map "\M-y" 'helm-show-kill-ring)

;;; stop evil from ruining emacs smart tab behaviour
(defun evil-undefine ()
(interactive)
(let (evil-mode-map-alist)
  (call-interactively (key-binding (this-command-keys)))))
(define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)

;; install from melpa, see vim surround for bindings
(global-evil-surround-mode 1)

;; evil-leader-mode from melpa
(evil-leader/set-key
 "e" 'ido-find-file
 "b" 'switch-to-buffer
 "k" 'kill-buffer
 ;; "f" 'projectile-find-file
 "f" 'helm-projectile-find-file-dwim
 ;; "p" 'projectile-switch-project
 "p" 'helm-projectile-switch-project
 ;; "b" 'projectile-switch-to-buffer
 "b" 'helm-projectile-switch-to-buffer
 "D" 'projectile-dired
 "d" 'projectile-find-dir
 "\C-d" 'dired-jump
 ;; "a" 'ag-project
 "a" 'helm-ag
 "A" 'ag
 "q" 'evil-emacs-state
 "x" 'smex
 "j" 'avy-goto-char
 "J" 'avy-goto-char-2
 "l" 'avy-goto-line
 "w" 'avy-goto-word-1
 ";" 'comment-region-or-line
 "?" '(lambda () (interactive) (find-file "~/notes/vim.cheat"))
 "g" 'magit-status
 "o" 'helm-occur
 "m" 'evil-visual-mark-mode ;from melpa
 "s" 'helm-swoop            ;from melpa
 "r" 'helm-all-mark-rings
 ;; "ci" 'evilnc-comment-or-uncomment-lines
 ;; "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
 ;; ;; "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
 ;; "cc" 'evilnc-copy-and-comment-lines
 ;; "cp" 'evilnc-comment-or-uncomment-paragraphs
 ;; "cr" 'comment-or-uncomment-region
 ;; "cv" 'evilnc-toggle-invert-comment-line-by-line
 ;; "\\" 'evilnc-comment-operator
 )

;; get back to normal state
(defalias 'vi 'evil-normal-state)

;; in magit start insert mode when editing commit messages
(evil-set-initial-state 'magit-log-edit-mode 'insert)
(evil-set-initial-state 'git-commit-mode 'insert)

;; use evil bindings in magit
(evil-set-initial-state 'magit-status-mode 'motion)
(evil-define-key 'motion magit-status-mode-map
  "\C-f" 'evil-scroll-page-down
  "\C-b" 'evil-scroll-page-up
  ;; (kbd "RET") 'magit-visit-item
  (kbd "RET") 'magit-diff-visit-file
  (kbd "TAB") 'magit-section-toggle
  "." 'magit-mark-item
  "=" 'magit-diff-with-mark
  "C" 'magit-add-log
  "l" 'magit-log-popup
  "I" 'magit-ignore-item-locally
  "S" 'magit-stage-all
  "U" 'magit-unstage-all
  "X" 'magit-reset-working-tree
  "d" 'magit-discard-item
  "i" 'magit-ignore-item
  "s" 'magit-stage-item
  "u" 'magit-unstage-item
  "z" 'magit-key-mode-popup-stashing
  )

(evil-set-initial-state 'magit-blame-mode 'motion)
(evil-define-key 'motion magit-blame-map
  "q" 'magit-blame-mode ;toggle blame mode off
  )
(evil-set-initial-state 'magit-log-mode 'motion)
(evil-define-key 'motion magit-log-mode-map
  ;; "q" 'magit-blame-mode ;toggle blame mode off
  (kbd "RET") 'magit-show-commit
  )

;; evil motion for other modes
(evil-set-initial-state 'package-menu-mode 'motion)

(evil-set-initial-state 'help-mode 'motion)
(evil-define-key 'normal help-map
  "q" 'quit-window ;kill help buffer
  )