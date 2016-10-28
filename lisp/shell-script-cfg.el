(setq sh-mode-hook nil)

(add-hook
 'sh-mode-hook
 (lambda ()
   (setq sh-basic-offset 2)
   (setq sh-indentation 2)))

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
;; (add-to-list 'auto-mode-alist '("zsh/completion/_" . shell-script-mode))