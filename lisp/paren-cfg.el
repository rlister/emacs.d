(show-paren-mode 1)            ;parenthesis matching, steady
(smartparens-global-mode) ;smartparens-mode, install from melpa

;; default cfgs include important stuff like disable electric ' in word and lisp modes
(require 'smartparens-config)

;; extra pairs for erb
(sp-pair "<% " " %>")
(sp-pair "<%= " " %>")
