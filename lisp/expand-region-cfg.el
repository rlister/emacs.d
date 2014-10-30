;; expand region by syntactic units
;; git clone https://github.com/magnars/expand-region.el.git
(add-to-list 'load-path '"~/etc/emacs/pkg/expand-region.el")
(autoload 'er/expand-region "expand-region" nil t)

(global-set-key (kbd "C-]") 'er/expand-region)
(global-set-key (kbd "C-}") 'er/contract-region)
