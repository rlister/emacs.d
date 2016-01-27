(show-paren-mode 1)            ;parenthesis matching, steady
(smartparens-global-mode) ;smartparens-mode, install from melpa

;; default cfgs include important stuff like disable electric ' in word and lisp modes
(require 'smartparens-config)

;; extra pairs for erb
(sp-pair "<% " " %>")
(sp-pair "<%= " " %>")

;; slurp sexps into current delimiter pair
(global-set-key (kbd "M-0") 'sp-forward-slurp-sexp)
(global-set-key (kbd "M-9") 'sp-backward-slurp-sexp)