;; install from melpa
(autoload 'dot-mode-on "dot-mode" nil t) 
(add-hook 'find-file-hooks 'dot-mode-on)
