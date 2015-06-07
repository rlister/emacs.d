;; evil-leader has to do a little dance to load properly
(require 'evil-leader)
(setq evil-leader/in-all-states t)
(evil-leader/set-leader "<SPC>")
(evil-mode nil) ;; no idea
(global-evil-leader-mode)
(evil-mode 1)

;; override mode-line face by evil state
(defun set-evil-mode-line-face ()
  (let ((color (cond ((minibufferp) '(nil . "Cyan"))
                     ((evil-normal-state-p) '(nil . "PaleGreen"))
                     ((evil-insert-state-p) '(nil . "IndianRed"))
                     ((evil-visual-state-p) '(nil . "GoldenRod"))
                     ((evil-replace-state-p) '(nil . "LightCoral"))
                     ((evil-motion-state-p) '(nil . "RoyalBlue"))
                     ((evil-emacs-state-p)  '(nil . "CadetBlue"))
                     ;; ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                     (t '(nil . "Gray")))))
    ;(set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))

(add-hook 'post-command-hook 'set-evil-mode-line-face)

;; hack back in some emacs bindings I want available
(define-key evil-normal-state-map "\C-e" 'end-of-code-or-line)
(define-key evil-insert-state-map "\C-e" 'end-of-code-or-line)
(define-key evil-visual-state-map "\C-e" 'end-of-code-or-line)
(define-key evil-motion-state-map "\C-e" 'end-of-code-or-line)
;;(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
;;(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
;;(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
;;(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
;;(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
;;(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
;;(define-key evil-normal-state-map "\C-d" 'evil-delete-char)
;;(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
;;(define-key evil-visual-state-map "\C-d" 'evil-delete-char)
;;(define-key evil-normal-state-map "\C-n" 'evil-next-line)
;;(define-key evil-insert-state-map "\C-n" 'evil-next-line)
;;(define-key evil-visual-state-map "\C-n" 'evil-next-line)
;;(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
;;(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
;;(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
;;(define-key evil-normal-state-map "\C-w" 'evil-delete)
;;(define-key evil-insert-state-map "\C-w" 'evil-delete)
;;(define-key evil-visual-state-map "\C-w" 'evil-delete)
;;(define-key evil-normal-state-map "\C-y" 'yank)
;;(define-key evil-insert-state-map "\C-y" 'yank)
;;(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)
;;(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
;;(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)
(define-key evil-normal-state-map "\M-y" 'browse-kill-ring)
(define-key evil-insert-state-map "\M-y" 'browse-kill-ring)
(define-key evil-visual-state-map "\M-y" 'browse-kill-ring)

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
 "f" 'projectile-find-file
 "p" 'projectile-switch-project
 "b" 'projectile-switch-to-buffer
 "D" 'projectile-dired
 "d" 'projectile-find-dir
 "a" 'ag-project
 "A" 'ag
 "q" 'evil-emacs-state
 "x" 'smex
 "j" 'evil-ace-jump-char-mode
 "l" 'evil-ace-jump-line-mode
 "w" 'evil-ace-jump-word-mode
 (kbd "SPC") 'evil-ace-jump-char-mode
 ";" 'comment-region-or-line
 "?" '(lambda () (interactive) (find-file "~/notes/vim.cheat"))
 "g" 'magit-status
 "o" 'occur
 "ci" 'evilnc-comment-or-uncomment-lines
 "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
 ;; "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
 "cc" 'evilnc-copy-and-comment-lines
 "cp" 'evilnc-comment-or-uncomment-paragraphs
 "cr" 'comment-or-uncomment-region
 "cv" 'evilnc-toggle-invert-comment-line-by-line
 "\\" 'evilnc-comment-operator
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
  (kbd "RET") 'magit-visit-item
  (kbd "TAB") 'magit-toggle-section
  "." 'magit-mark-item
  "=" 'magit-diff-with-mark
  "C" 'magit-add-log
  "l" 'magit-key-mode-popup-logging
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
