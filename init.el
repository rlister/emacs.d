(setq debug-on-error nil)               ;turn on for debugging

(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)

(add-to-list 'exec-path "/usr/local/bin") ;brew executables, etc
(add-to-list 'load-path "~/code/emacs.d/vendor")  ;3rd-party code installed by hand
(add-to-list 'load-path "~/code/emacs.d/lisp") ;my stuff to be loaded below

(load-library "mac")                    ;some mac-specific settings
(load-library "basics")                 ;basic display and key tweaks
(load-library "ido-cfg")                ;setup ido
(load-library "smex-cfg")               ;C-xm, C-xC-m to replace M-x

(load-library "evil-cfg")               ;setup evil-mode
(load-library "key-chord-cfg")
(load-library "brew-theme")             ;my color theme
(load-library "projectile-cfg")
(load-library "mode-line")              ;setup modeline
;(load-library "powerline-cfg")          ;use powerline libs

(load-library "uniquify-cfg")           ;make buffer names unique
(load-library "kill-ring-cfg")          ;M-y
(load-library "insert-date-time")       ;M-x date
;(load-library "safe-quit")              ;prompt to quit emacs
(load-library "aliases")                ;some function shortcuts
(load-library "whitespace-cfg")         ;setup whitespace handling
(load-library "paren-cfg")              ;setup parentheses behaviour (inc smartparens)
;(load-library "hl-line-cfg")            ;highlight current line
;(load-library "enlarge-font-cfg")       ;C-+, C--
;(load-library "toggle-selective-display-column") ;C-TAB

;;; movement
;;(load-library "open-line-and-indent")     ;C-o
;(load-library "beginning-or-indentation") ;C-a
;; (load-library "end-of-code-or-line")      ;C-e (obsoleted by mwim)
;; (load-library "ace-jump-cfg")             ;C-x {j,w,l}, also C-cC-c in jump-char
(load-library "avy-cfg")                ;replaces ace-jump
;;(load-library "jump-char-cfg")            ;jump to char with M-j
(load-library "comment-region-or-line")   ;C-;
;(load-library "goto-line-with-feedback")  ;M-g g
;;(load-library "dot-mode-cfg")             ;C-. emulates vi .
;(load-library "goto-chg-cfg")             ;M-g M-g to goto last change
(load-library "imenu-cfg")                ;M-m
;;(load-library "expand-region-cfg")        ;expand region syntactically with C-]
;;(load-library "mark-forward-sexp-cfg")    ;C-c[oOiI]
;(load-library "toggle-selective-display-column") ;code folding with C-TAB
;;(load-library "visual-regexp-cfg")        ;C-c[rq]
;
;;; window movement
(load-library "window-movement")        ;moving between windows
;(load-library "resize-windows")         ;M-left,right,up,down
(load-library "transpose-windows")      ;M-x swap
;
;;; completion
(load-library "ac-complete-cfg")
;;(load-library "pabbrev-cfg")
;;(load-library "discover-cfg")
;
;;; programming modes
(load-library "git-cfg")                ;magit-mode
;(load-library "js-cfg")                 ;javascript settings
;(load-library "json-cfg")               ;json-mode and json-pretty-print
(load-library "ruby-cfg")               ;ruby-mode
;(load-library "rainbow-mode-cfg")       ;show colours
;(load-library "shell-script-cfg")       ;shell-script-mode
;(load-library "yaml-cfg")               ;yaml-mode
;(load-library "ag-cfg")                 ;ag, ag-project (silver searcher)
;(load-library "golang-cfg")             ;setup go-mode
;(load-library "nginx-cfg")              ;nginx-mode
(load-library "terraform-cfg")          ;terraform-mode
;;(load-library "pretty-symbols")         ;function and lambda symbols
;;(load-library "elisp-cfg")              ;elisp hooks
;;(load-library "haml-cfg")               ;haml-mode
;;(load-library "css-cfg")                ;css/scss settings
;;(load-library "puppet-cfg")             ;puppet-mode
;;(load-library "flycheck-cfg")           ;turn on globally
(load-library "conf-cfg")               ;conf-mode
;
;;; services
;(load-library "slack-cfg")
;(load-library "haste-cfg")
;;(load-library "erc-cfg")                ;C-c e for ERC
;
;;; (load-library "perspective-cfg")
;(load-library "org-present-cfg")
;
;;; shells
;(load-library "shell-dedicated")        ;M-i, M-,
;;(load-library "multi-term-cfg")         ;C-z c
;;; (load-library "shell-mode-cfg")         ;shell-mode extras
;;(load-library "dired-cfg")              ;dired+ etc
;
;;; (toggle-frame-maximized)                ;start up maximized
