(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (smartparens-global-mode t)
  :config
  (progn
    (require 'smartparens-config) ;default cfgs include e.g. disable electric ' in word and lisp modes
    (smartparens-global-mode t)
    (sp-pair "<% " " %>")                 ;extra pairs for erb
    (sp-pair "<%= " " %>")
    )
  :bind (
         ;; slurp sexps into current delimiter pair
         ("M-0" . sp-forward-slurp-sexp)
         ("M-9" . sp-backward-slurp-sexp)
         )
  )