(use-package counsel
  :ensure t
  :init
  (define-key global-map [remap find-file] 'counsel-find-file)
  (define-key global-map [remap yank-pop] 'counsel-yank-pop)
  (define-key global-map [remap isearch-forward] 'counsel-grep-or-swiper)
  (define-key global-map [remap describe-function] 'counsel-describe-function)
  (define-key global-map [remap describe-variable] 'counsel-describe-variable)
  :bind (
         ("C-SPC"   . counsel-M-x)
         ("C-x m"   . counsel-M-x)
         ("C-x C-m" . counsel-M-x)
         ))