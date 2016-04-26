;;; -*- lexical-binding: t -*-
(require 'evil-leader)
(setq evil-leader/in-all-states t)
(evil-leader/set-leader "<SPC>")
(evil-mode nil) ;; no idea
(global-evil-leader-mode)
(evil-mode 1)

;; ;; match all the things on %, install evil-matchit from melpa
;; ;(global-evil-matchidfj-mode 1)

;; ;; highlights unique chars on f/F/t/T, install from melpa
;; (global-evil-quickscope-mode 1)

;; override mode-line face by evil state
(defun set-evil-mode-line-face ()
  (let ((color (cond
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

(add-hook 'post-command-hook 'set-evil-mode-line-face)

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
;; (define-key evil-normal-state-map "\M-y" 'helm-show-kill-ring)
;; (define-key evil-insert-state-map "\M-y" 'helm-show-kill-ring)
;; (define-key evil-visual-state-map "\M-y" 'helm-show-kill-ring)
(define-key evil-normal-state-map "\M-y" 'counsel-yank-pop)
(define-key evil-insert-state-map "\M-y" 'counsel-yank-pop)
(define-key evil-visual-state-map "\M-y" 'counsel-yank-pop)

;;; stop evil from ruining emacs smart tab behaviour
(defun evil-undefine ()
  (interactive)
  (let (evil-mode-map-alist)
    (call-interactively (key-binding (this-command-keys)))))
(define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)

;; install from melpa, see vim surround for bindings
(global-evil-surround-mode 1)

;; (defun toggle-hide-mode-line ()
;;   "Toggle mode-line on or off, and redraw display."
;;   (interactive)
;;   (hide-mode-line)
;;   (redraw-display))

(evil-leader/set-key
 ";" 'comment-region-or-line
 "?" '(lambda () (interactive) (find-file "~/notes/vim.cheat"))
 "ag" 'ag                                ;ag directory
 "ap" 'projectile-ag                     ;ag whole project
 "ar" 'align-regexp
 "b" 'projectile-switch-to-buffer
 ;; "c" 'capitalize-word
 "c" (lambda () (interactive) (org-capture nil "t") (evil-append-line 1))
 "D" 'projectile-dired
 "d" 'projectile-find-dir
 "\C-d" 'dired-jump
 "e" 'ido-find-file
 "f" 'projectile-find-file
 "g" 'magit-status
 "j" 'avy-goto-char
 "k" 'kill-buffer
 "J" 'avy-goto-char-2
 "L" 'link-hint-open-link ;link-hint from melpa for avy to link
 "l" 'avy-goto-line
 "M" 'evil-visual-mark-mode ;from melpa
 "m" 'toggle-hide-mode-line
 "n" 'message-buffer-name
 "o" 'helm-occur
 "p" 'projectile-switch-project
 "q" 'evil-emacs-state
 "R" 'helm-all-mark-rings
 "r" 'ivy-resume
 "s" 'swiper
 "t" (lambda () (interactive) (find-file "~/notes/todo.org"))
 "u" 'counsel-unicode-char  ;insert unicode chars
 "W" 'avy-goto-word-1
 "w" 'save-buffer
 "x" 'counsel-M-x
 "SPC" 'toggle-previous-buffer
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

(evil-set-initial-state 'org-agenda-mode   'motion)
(evil-define-key 'motion org-agenda-mode-map
  (kbd "j") 'org-agenda-next-line)
(evil-define-key 'motion org-agenda-mode-map
  (kbd "k") 'org-agenda-previous-line)
(evil-define-key 'motion org-agenda-mode-map
  (kbd "TAB") 'org-agenda-goto)
(evil-define-key 'motion org-agenda-mode-map
  (kbd "F") 'org-agenda-follow-mode)

(evil-set-initial-state 'help-mode 'motion)
(evil-define-key 'normal help-map
  "q" 'quit-window ;kill help buffer
  )

;; use key-chord from melpa
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer))
(setq evil-visual-state-cursor '("yellow" box)); █
(setq evil-insert-state-cursor '("red" bar)); ⎸
(setq evil-emacs-state-cursor '("blue" hbar)); _
(setq evil-normal-state-cursor '("green" hbar)); _
; '\ePtmux;\e\e[4 q\e\\']
;; (defun etcc--make-cursor-shape-seq (shape)
;;   "Make escape sequence for cursor shape."
;;   (cond ((or (etcc--in-xterm?)
;;              (etcc--in-apple-terminal?)
;;              (etcc--in-iterm?))
;;          (etcc--make-tmux-seq (etcc--make-xterm-cursor-shape-seq shape)))
;;         ((etcc--in-konsole?)
;;          (etcc--make-konsole-cursor-shape-seq shape))
;;         ((etcc--in-dumb?)
;;          (etcc--make-xterm-cursor-shape-seq shape))))