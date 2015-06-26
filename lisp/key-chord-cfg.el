;; wget http://emacswiki.org/emacs/download/key-chord.el
(require 'key-chord)
(key-chord-mode 1)

;; (key-chord-define-global ".;" 'comment-region-or-line)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
