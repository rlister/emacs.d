;; smex replaces M-x (execute-extended-command) with ido goodness (install from melpa)
(autoload 'smex "smex" nil t)
(global-set-key (kbd "C-x m")   'smex)  ;use this instead of M-x
(global-set-key (kbd "C-x C-m") 'smex)  ;common typo
(global-set-key (kbd "C-x M")   'smex-major-mode-commands)  ;typo the above
