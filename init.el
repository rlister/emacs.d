;; (setq debug-on-error nil)               ;turn on for debugging

(add-to-list 'exec-path "/usr/local/bin") ;brew executables, etc
(add-to-list 'load-path "~/code/emacs.d/lisp") ;my stuff to be loaded below

(package-initialize)                    ;put this here or package will add it
(load-library "package-cfg")            ;add melpa and initialize

(load-library "linux")                  ;linux-specific settings
(load-library "mac")                    ;mac-specific settings
(load-library "basics")                 ;basic display and key tweaks
(load-library "brew-theme")             ;my color theme
(load-library "epa-cfg")                ;epa for gpg files
(load-library "comment-region-or-line") ;C-z ;
(load-library "term-cfg")
(load-library "whitespace-cfg")         ;setup whitespace handling
(load-library "imenu-cfg")              ;M-m
(load-library "dired-cfg")

;; packages for swiper
(load-library "swiper-cfg")
(load-library "counsel-cfg")
(load-library "ivy-cfg")
(load-library "counsel-projectile-cfg")

;; packages for evil mode
(load-library "mwim-cfg")               ;intelligent beg/end of line
(load-library "evil-cfg")               ;setup evil-mode
(load-library "evil-surround-cfg")
(load-library "vim-empty-lines-cfg")    ;tilde for traling empty lines
(load-library "key-chord-cfg")          ;jk binding

;; packages for projectile and perspective
(load-library "projectile-cfg")
;; (load-library "persp-projectile-cfg")
(load-library "mode-line")              ;setup modeline for evil and projectile
(load-library "term-projectile-cfg")    ;manage terms per project

;; other packages
(load-library "uniquify-cfg")           ;make buffer names unique
(load-library "smartparens-cfg")        ;setup parentheses behaviour (inc smartparens)
;(load-library "aggressive-indent-cfg")  ;crazy

;(load-library "toggle-selective-display-column") ;code folding with C-TAB

;; ;;; window movement
;; (load-library "window-movement")        ;moving between windows

;; completion
(load-library "pabbrev-cfg")
;(load-library "discover-cfg")
; (load-library "ac-complete-cfg")

;; packages for git
(load-library "magit-cfg")              ;magit-mode
(load-library "evil-magit-cfg")         ;fix keys in magit
(load-library "git-gutter-fringe-cfg")
(load-library "git-timemachine-cfg")    ;fixups for evil

;; programming modes
(load-library "ruby-cfg")               ;ruby-mode
(load-library "chruby-cfg")             ;chruby package
(load-library "js-cfg")                 ;javascript settings
(load-library "json-cfg")               ;json-mode and json-pretty-print
(load-library "shell-script-cfg")       ;shell-script-mode
(load-library "yaml-cfg")               ;yaml-mode
(load-library "ag-cfg")                 ;ag, ag-project (silver searcher)
(load-library "golang-cfg")             ;setup go-mode
(load-library "nginx-cfg")              ;nginx-mode

(load-library "org-cfg")                ;todo lists, etc
;; (put 'dired-find-alternate-file 'disabled nil)