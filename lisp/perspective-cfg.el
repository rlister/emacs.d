(persp-mode t)
;; (global-set-key (kbd "C-z C-z") 'persp-switch)
;; (global-set-key (kbd "C-z z")   'persp-switch)
(global-set-key (kbd "C-'")     'persp-switch)

;; make a unique shell buffer for each perspective
(defun persp-shell-dedicated-toggle ()
  "shell-dedicated-toggle with perspective-unique buffer name."
  (interactive)
  (shell-dedicated-toggle (format "*shell: %s*" (persp-name persp-curr))))

(global-set-key (kbd "C-,") 'persp-shell-dedicated-toggle)
