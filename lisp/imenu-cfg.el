;; imenu is in emacs24
;; now we use ivy-mode, so just call this raw
(require 'imenu)
(global-set-key (kbd "M-m") 'imenu)