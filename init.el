;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

;; (setq debug-on-error nil)               ;turn on for debugging

;; ;; install cask from homebrew, manages package dependencies
;; (require 'cask "/usr/local/Cellar/cask/0.7.4/cask.el")
;; (cask-initialize)

;; ;; adds/removes packages from Cask file automatically
;; (require 'pallet)
;; (pallet-mode t)

(add-to-list 'exec-path "/usr/local/bin") ;brew executables, etc
(add-to-list 'load-path "~/code/emacs.d/lisp") ;my stuff to be loaded below

(load-library "mac")                    ;some mac-specific settings
(load-library "basics")                 ;basic display and key tweaks
(load-library "brew-theme")             ;my color theme
(load-library "gpg-cfg")                ;for epg and epa
(load-library "term-cfg")
;; (load-library "iterm-cfg")
(load-library "ivy-cfg")                ;ivy completion lib
(load-library "projectile-cfg")
(load-library "mode-line")              ;setup modeline
;; (load-library "hide-mode-line")
(load-library "uniquify-cfg")           ;make buffer names unique
;; (load-library "insert-date-time")       ;M-x date
(load-library "aliases")                ;some function shortcuts
(load-library "whitespace-cfg")         ;setup whitespace handling
(load-library "paren-cfg")              ;setup parentheses behaviour (inc smartparens)

;;; movement
(load-library "comment-region-or-line")   ;C-;
(load-library "imenu-cfg")                ;M-m
;(load-library "toggle-selective-display-column") ;code folding with C-TAB
;; packages
(load-library "package-cfg")            ;add melpa and initialize
(load-library "swiper-cfg")
(load-library "counsel-cfg")
(load-library "ivy-cfg")
(load-library "mwim-cfg")               ;intelligent beg/end of line
(load-library "evil-cfg2")              ;setup evil-mode
(load-library "evil-surround-cfg")
(load-library "key-chord-cfg")          ;jk binding
(load-library "projectile-cfg")
(load-library "persp-projectile-cfg")
(load-library "mode-line")              ;setup modeline for evil
(load-library "term-projectile-cfg")    ;manage terms per project
(load-library "uniquify-cfg")           ;make buffer names unique

;;; window movement
(load-library "window-movement")        ;moving between windows

;;; completion
;; (load-library "ac-complete-cfg")
(load-library "pabbrev-cfg")
;;(load-library "discover-cfg")

;;; programming modes
(load-library "git-cfg")                ;magit-mode
(load-library "ruby-cfg")               ;ruby-mode
(load-library "js-cfg")                 ;javascript settings
(load-library "json-cfg")               ;json-mode and json-pretty-print
(load-library "shell-script-cfg")       ;shell-script-mode
;(load-library "yaml-cfg")               ;yaml-mode
(load-library "ag-cfg")                 ;ag, ag-project (silver searcher)
(load-library "golang-cfg")             ;setup go-mode
(load-library "nginx-cfg")              ;nginx-mode
(load-library "terraform-cfg")          ;terraform-mode
(load-library "elisp-cfg")              ;elisp hooks
(load-library "conf-cfg")               ;conf-mode

(load-library "org-cfg")                ;todo lists, etc
(put 'dired-find-alternate-file 'disabled nil)