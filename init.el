(setq debug-on-error nil)               ;turn on for debugging

(add-to-list 'exec-path "/usr/local/bin") ;brew executables, etc
(add-to-list 'exec-path "~/bin") ;brew executables, etc
(add-to-list 'load-path "~/etc/emacs.d/lisp") ;my stuff to be loaded below

(load-theme 'brew t)

(load-library "package-cfg")            ;bootstrap package system
;; (package-initialize t)                  ;put this here or package will add it

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
(load-library "face-remap-cfg")         ;M-{=,-,0}

(load-library "epa-cfg")                ;epa for gpg files
(load-library "simple-cfg")             ;delete-trailing-whitespace
(load-library "ric-comment-dwim")       ;C-; for commenting
(load-library "ric-space-dwim")         ;C-\ to compress whitespace
(load-library "imenu-cfg")              ;M-m
;; (load-library "text-cfg")               ;text-mode
(load-library "dired-cfg")
;; (load-library "dired-k-cfg")            ;git status and colour
;; (load-library "wdired-cfg")             ;e to edit dired filenames
(load-library "man-cfg")                ;man pages
;; (load-library "align-cfg")              ;C-x :
(load-library "winner-cfg")             ;C-c left/right
(load-library "windsize-cfg")           ;M-{left,right,up,down}
(load-library "ric-transpose-windows")  ;swap

;; packages for swiper
(load-library "swiper-cfg")
(load-library "counsel-cfg")
(load-library "ivy-cfg")
(load-library "ivy-rich-cfg")
(load-library "counsel-projectile-cfg")
(load-library "avy-cfg")
(load-library "link-hint")

;; packages for evil mode
(load-library "mwim-cfg")               ;intelligent beg/end of line
(load-library "evil-cfg")               ;setup evil-mode
(load-library "evil-surround-cfg")
;; (load-library "vim-empty-lines-cfg")    ;tilde for traling empty lines
;; (load-library "key-chord-cfg")          ;jk binding

;; packages for projectile and perspective
(load-library "projectile-cfg")
;; (load-library "persp-projectile-cfg")
(load-library "mode-line")              ;setup modeline for evil and projectile
;; (load-library "which-func-cfg")         ;which-function in mode-line

;; terminals and shells
(load-library "vterm-cfg")               ;vterm-mode
;; (load-library "term-cfg")               ;term-mode
;; (load-library "term-projectile-cfg")    ;manage terms per project
;; (load-library "shell-cfg")              ;shell
;; (load-library "ric-mini-shell-cfg")     ;C-,

;; other packages
(load-library "uniquify-cfg")           ;make buffer names unique
(load-library "paren-cfg")              ;paren matching
(load-library "smartparens-cfg")        ;setup parentheses behaviour (inc smartparens)

;(load-library "toggle-selective-display-column") ;code folding with C-TAB

;; window movement
;(load-library "window-movement")        ;moving between windows

;; completion
(load-library "pabbrev-cfg")
;(load-library "discover-cfg")

;; packages for git
(load-library "magit-cfg")              ;magit-mode
(load-library "evil-magit-cfg")         ;fix keys in magit
;; (load-library "git-gutter-fringe-cfg")
(load-library "git-timemachine-cfg")    ;fixups for evil
(load-library "git-link-cfg")           ;git-link
(load-library "autorevert-cfg")         ;update git branch in modeline

;; programming modes
(load-library "chruby-cfg")             ;chruby package
;; (load-library "inf-ruby-cfg")           ;irb, pry, etc
(load-library "ruby-cfg")               ;ruby-mode
(load-library "js-cfg")                 ;javascript settings
(load-library "python-cfg")             ;python-mode
(load-library "json-cfg")               ;json-mode and json-pretty-print
(load-library "sh-script-cfg")          ;shell-script-mode
(load-library "yaml-cfg")               ;yaml-mode
(load-library "ag-cfg")                 ;ag, ag-project (silver searcher)
(load-library "golang-cfg")             ;setup go-mode
(load-library "nginx-cfg")              ;nginx-mode
(load-library "markdown-cfg")           ;markdown-mode
(load-library "dockerfile-cfg")         ;dockerfile-mode
;; (load-library "dumb-jump-cfg")          ;dumb-jump
(load-library "string-inflection-cfg")  ;toggle camel/snake-cases
;; (load-library "auctex-cfg")             ;TeX
;(load-library "rust-cfg")               ;rust-mode

(load-library "org-cfg")                ;todo lists, etc
(load-library "org-capture-cfg")        ;capture to org buffers
;; (load-library "mu4e-cfg")
