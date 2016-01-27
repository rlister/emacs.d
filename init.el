(setq debug-on-error nil)               ;turn on for debugging

;; install cask from homebrew, manages package dependencies
(require 'cask "/usr/local/Cellar/cask/0.7.4/cask.el")
(cask-initialize)

;; adds/removes packages from Cask file automatically
(require 'pallet)

(add-to-list 'exec-path "/usr/local/bin") ;brew executables, etc
;; (add-to-list 'load-path "~/code/emacs.d/vendor")  ;3rd-party code installed by hand
(add-to-list 'load-path "~/code/emacs.d/lisp") ;my stuff to be loaded below

(load-library "mac")                    ;some mac-specific settings
(load-library "basics")                 ;basic display and key tweaks
(load-library "evil-cfg")               ;setup evil-mode
(load-library "ivy-cfg")                ;ivy completion lib
(load-library "brew-theme")             ;my color theme
(load-library "projectile-cfg")
(load-library "mode-line")              ;setup modeline
(load-library "hide-mode-line")
(load-library "uniquify-cfg")           ;make buffer names unique
(load-library "insert-date-time")       ;M-x date
(load-library "aliases")                ;some function shortcuts
(load-library "whitespace-cfg")         ;setup whitespace handling
(load-library "paren-cfg")              ;setup parentheses behaviour (inc smartparens)
;(load-library "hl-line-cfg")            ;highlight current line
;(load-library "enlarge-font-cfg")       ;C-+, C--
;(load-library "toggle-selective-display-column") ;C-TAB
(load-library "org-cfg")                ;todo lists, etc

;;; movement
;; (load-library "avy-cfg")                ;replaces ace-jump
(load-library "comment-region-or-line")   ;C-;
;(load-library "goto-line-with-feedback")  ;M-g g
(load-library "imenu-cfg")                ;M-m
;(load-library "toggle-selective-display-column") ;code folding with C-TAB
;
;;; window movement
(load-library "window-movement")        ;moving between windows
;
;;; completion
;; (load-library "ac-complete-cfg")
(load-library "pabbrev-cfg")
;;(load-library "discover-cfg")
;
;;; programming modes
(load-library "git-cfg")                ;magit-mode
(load-library "ruby-cfg")               ;ruby-mode
(load-library "js-cfg")                 ;javascript settings
(load-library "json-cfg")               ;json-mode and json-pretty-print
(load-library "shell-script-cfg")       ;shell-script-mode
;(load-library "yaml-cfg")               ;yaml-mode
;(load-library "ag-cfg")                 ;ag, ag-project (silver searcher)
(load-library "golang-cfg")             ;setup go-mode
;(load-library "nginx-cfg")              ;nginx-mode
(load-library "terraform-cfg")          ;terraform-mode
(load-library "elisp-cfg")              ;elisp hooks
(load-library "conf-cfg")               ;conf-mode

(put 'dired-find-alternate-file 'disabled nil)