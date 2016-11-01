(setq debug-on-error t)               ;turn on for debugging

(add-to-list 'exec-path "/usr/local/bin") ;brew executables, etc
(add-to-list 'load-path "~/code/emacs.d/lisp") ;my stuff to be loaded below

(load-library "package-cfg")            ;bootstrap package system
(package-initialize t)                  ;put this here or package will add it

;; OS-specfics
(load-library "linux")                  ;linux-specific settings
(load-library "mac")                    ;mac-specific settings

;; basic appearance and behaviour
(load-library "basics")                 ;basic display and key tweaks
(load-library "menu-bar-cfg")
(load-library "tool-bar-cfg")
(load-library "scroll-bar-cfg")
(load-library "frame-cfg")
(load-library "delsel-cfg")
(load-library "files-cfg")
(load-library "narrow-cfg")
(load-library "brew-theme")             ;my color theme
(load-library "face-remap-cfg")         ;M-{=,-,0}

(load-library "epa-cfg")                ;epa for gpg files
(load-library "simple-cfg")             ;delete-trailing-whitespace
(load-library "ric-comment-dwim")       ;C-z ; for commenting
(load-library "ric-space-dwim")         ;C-\ to compress whitespace
(load-library "ric-transpose-windows")  ;swap
(load-library "ric-mini-shell-cfg")     ;C-,
(load-library "imenu-cfg")              ;M-m
(load-library "text-cfg")               ;text-mode
(load-library "dired-cfg")
(load-library "dired-k-cfg")            ;git status and colour
(load-library "wdired-cfg")             ;e to edit dired filenames
(load-library "man-cfg")                ;man pages
(load-library "align-cfg")              ;C-x :
(load-library "winner-cfg")             ;C-c left/right
(load-library "windsize-cfg")           ;M-{left,right,up,down}

;; packages for swiper
(load-library "swiper-cfg")
(load-library "counsel-cfg")
(load-library "ivy-cfg")
(load-library "counsel-projectile-cfg")
(load-library "avy-cfg")                ;C-j for jumping

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
(load-library "term-cfg")               ;term-mode
(load-library "term-projectile-cfg")    ;manage terms per project

;; other packages
(load-library "uniquify-cfg")           ;make buffer names unique
(load-library "paren-cfg")              ;paren matching
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
(load-library "git-link-cfg")           ;git-link

;; programming modes
(load-library "chruby-cfg")             ;chruby package
(load-library "inf-ruby-cfg")           ;irb, pry, etc
(load-library "ruby-cfg")               ;ruby-mode
(load-library "js-cfg")                 ;javascript settings
(load-library "json-cfg")               ;json-mode and json-pretty-print
(load-library "sh-script-cfg")          ;shell-script-mode
(load-library "yaml-cfg")               ;yaml-mode
(load-library "ag-cfg")                 ;ag, ag-project (silver searcher)
(load-library "golang-cfg")             ;setup go-mode
(load-library "nginx-cfg")              ;nginx-mode

(load-library "org-cfg")                ;todo lists, etc
(load-library "org-protocol-cfg")       ;capture to org buffers