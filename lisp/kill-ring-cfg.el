(global-set-key (kbd "M-c") 'kill-ring-save)  ;cua-compat
(global-set-key (kbd "M-U") 'capitalize-word) ;since I stole M-c
(setq kill-do-not-save-duplicates t)          ;no adjacent dupes

;; install browse-kill-ring from melpa
(browse-kill-ring-default-keybindings)  ;this binds M-y if not preceded by C-y

;; allow me to keep hitting M-y to move down kr list
(eval-after-load 'browse-kill-ring
  '(define-key browse-kill-ring-mode-map (kbd "M-y") 'browse-kill-ring-forward))

(setq browse-kill-ring-highlight-current-entry t)

;; for haxorz: you can also use this function with your own ring
;(kill-ring-ido nil "Choose something: " (list "long long" "loooooooooooooooooooooooooong" "short"))
