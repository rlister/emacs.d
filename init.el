(setq debug-on-error nil)               ;turn on for debugging

(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)

(add-to-list 'exec-path "/usr/local/bin") ;brew executables, etc
(add-to-list 'load-path "~/code/emacs.d/vendor")  ;3rd-party code installed by hand
(add-to-list 'load-path "~/code/emacs.d/lisp") ;my stuff to be loaded below

(load-library "brew-theme")             ;my color theme

(load-library "mac")                    ;some mac-specific settings
(load-library "basics")
(load-library "ido-cfg")
(load-library "uniquify-cfg")           ;make buffer names unique
(load-library "kill-ring-cfg")          ;M-y
(load-library "mode-line")              ;setup modeline
(load-library "world-time-cfg")         ;timezones
(load-library "insert-date-time")       ;M-x date

(load-library "smex-cfg")               ;C-xm, C-xC-m to replace M-x
(load-library "safe-quit")              ;prompt to quit emacs
(load-library "aliases")                ;some function shortcuts
(load-library "whitespace-cfg")         ;setup whitespace handling
(load-library "paren-cfg")              ;setup parentheses behaviour (inc smartparens)
(load-library "hl-line-cfg")            ;highlight current line
(load-library "enlarge-font-cfg")       ;C-+, C--

;; movement
(load-library "open-line-and-indent")     ;C-o
(load-library "beginning-or-indentation") ;C-a
(load-library "end-of-code-or-line")      ;C-e
(load-library "ace-jump-cfg")             ;C-x {j,w,l}, also C-cC-c in jump-char
;(load-library "expand-region-cfg")        ;expand region syntactically with C-]
(load-library "jump-char-cfg")            ;jump to char with M-j
(load-library "mark-forward-sexp-cfg")    ;C-c[oOiI]
(load-library "comment-region-or-line")   ;C-;
;(load-library "toggle-selective-display-column") ;code folding with C-TAB
(load-library "goto-line-with-feedback")  ;M-g g
(load-library "dot-mode-cfg")             ;C-. emulates vi .
(load-library "goto-chg-cfg")             ;M-g M-g to goto last change
(load-library "imenu-cfg")                ;M-m
(load-library "goto-top-or-bottom")       ;chord jg
;(load-library "visual-regexp-cfg")        ;C-c[rq]
;(load-library "goto-top-or-bottom")       ;M-g M-g

;; window movement
(load-library "window-movement")        ;moving between windows
;; (load-library "transpose-windows")      ;M-x swap
(load-library "resize-windows")         ;M-left,right,up,down

;; shells
;; (load-library "term-mode-cfg")          ;M-x term
(load-library "shell-dedicated")        ;M-i, M-,
(load-library "multi-term-cfg")         ;C-z c
(load-library "shell-mode-cfg")         ;shell-mode extras

;; completion
(load-library "ac-complete-cfg")

;; programming modes
(load-library "ruby-cfg")               ;ruby-mode
;(load-library "pretty-symbols")         ;function and lambda symbols
;(load-library "elisp-cfg")              ;elisp hooks
(load-library "js-cfg")                 ;javascript settings
(load-library "json-cfg")               ;json-mode and json-pretty-print
;(load-library "haml-cfg")               ;haml-mode
(load-library "git-cfg")                ;magit-mode
(load-library "rainbow-mode-cfg")       ;show colours
;(load-library "css-cfg")                ;css/scss settings
(load-library "shell-script-cfg")       ;shell-script-mode
;(load-library "puppet-cfg")             ;puppet-mode
(load-library "yaml-cfg")               ;yaml-mode
;;; (load-library "speedbar-cfg")           ;sr-speedbar-open
(load-library "ag-cfg")                 ;ag, ag-project (silver searcher)
(load-library "golang-cfg")             ;setup go-mode
;;; (load-library "flycheck-cfg")           ;turn on globally
(load-library "nginx-cfg")              ;nginx-mode
(load-library "slack-cfg")

(load-library "projectile-cfg")
(load-library "perspective-cfg")
(load-library "key-chord-cfg")

(load-library "erc-cfg")                ;C-c e for ERC

(toggle-frame-maximized)                ;start up maximized
