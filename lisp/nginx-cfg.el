;; installed from melpa
(eval-after-load "nginx-mode"
  '(progn
     (setq nginx-indent-level 2)))

;; use for all files in this dir
(add-to-list 'auto-mode-alist
             '("spree_nginx/files/default/.*" . nginx-mode))
