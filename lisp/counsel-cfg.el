(use-package counsel
  :ensure t
  :init
  (define-key global-map [remap find-file] 'counsel-find-file)
  (define-key global-map [remap yank-pop] 'counsel-yank-pop)
  (define-key global-map [remap isearch-forward] 'counsel-grep-or-swiper)
  (define-key global-map [remap describe-function] 'counsel-describe-function)
  (define-key global-map [remap describe-variable] 'counsel-describe-variable)
  (define-key global-map (kbd "H-f") 'counsel-find-file)
  (define-key global-map (kbd "C-M-s-f") 'counsel-find-file)
  (define-key global-map (kbd "H-i") 'counsel-imenu)
  (define-key global-map (kbd "C-M-s-i") 'counsel-imenu)
  (define-key global-map (kbd "H-m") 'counsel-M-x)
  (define-key global-map (kbd "C-M-s-m") 'counsel-M-x)
  :bind (
         ("C-x m"   . counsel-M-x)
         ("C-x C-m" . counsel-M-x)
         ))