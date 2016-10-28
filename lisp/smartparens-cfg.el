(use-package smartparens
  :config
  (smartparens-global-mode) ;smartparens-mode, install from melpa
  ;; default cfgs include important stuff like disable electric ' in word and lisp modes
  (require 'smartparens-config)
  ;; extra pairs for erb
  (sp-pair "<% " " %>")
  (sp-pair "<%= " " %>")
  :bind (
         ;; slurp sexps into current delimiter pair
         ("M-0" . sp-forward-slurp-sexp)
         ("M-9" . sp-backward-slurp-sexp)
         )
  )