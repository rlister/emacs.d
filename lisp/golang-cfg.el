;; go-mode from melpa
(defun my-go-mode-hook () 
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq tab-width 2 indent-tabs-mode 1))

(add-hook 'go-mode-hook 'my-go-mode-hook)
