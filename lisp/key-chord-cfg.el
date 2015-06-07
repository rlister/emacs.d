;; wget http://emacswiki.org/emacs/download/key-chord.el
(require 'key-chord)
(key-chord-mode 1)

;(key-chord-define-global ",." "<>\C-b")
;; (key-chord-define-global "%%" 'goto-match-paren)

;; (key-chord-define-global "jk" 'execute-extended-command)
;; (key-chord-define-global "jk" 'term-toggle-line-char-mode)
;; (key-chord-define-global "jj" 'ace-jump-char-mode)
;; (key-chord-define-global "jl" 'ace-jump-line-mode)
;; (key-chord-define-global "jb" 'ace-jump-buffer)
;; (key-chord-define-global "jf" 'find-file)
;; (key-chord-define-global "jh" 'helm-mini)
;; (key-chord-define-global "qq" '(lambda () (interactive) (quit-window nil (next-window))))

;(key-chord-define-global "yy" 'yank)
;(key-chord-define-global "uu" 'undo)
;; (key-chord-define-global "ii" 'god-local-mode)

;; (key-chord-define-global "jk" 'term-toggle-line-char-mode)
;; (key-chord-define-global "jk" projectile-command-map)
;; (key-chord-define-global "jp" 'helm-projectile)
;; (key-chord-define-global "jm" 'persp-switch)

;; (key-chord-define-global "jb" 'ido-switch-buffer)
;; (key-chord-define-global "jg" 'move-to-window-line-top-bottom)

;; (key-chord-define-global ".;" 'comment-region-or-line)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
