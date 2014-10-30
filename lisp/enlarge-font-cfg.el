(autoload 'enlarge-font "enlarge-font" nil t)

;; bind zoom in and out (C-- was negative-argument, which is also on M--)
(global-set-key (kbd "C-=") '(lambda () (interactive) (enlarge-font 1)))
(global-set-key (kbd "C--") '(lambda () (interactive) (enlarge-font -1)))
