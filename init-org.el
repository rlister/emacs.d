(setq org-adapt-indentation nil)
(setq org-src-fontify-natively t)
(setq org-src-window-setup 'current-window) ;do not split windows
(setq org-use-speed-commands 't) ;use speedkeys at start of headline (? for list of keys)
(setq org-startup-folded t)      ;no expand all levels on opening file
(setq org-directory "~/src/doc")
(setq org-log-done 'time)
(setq org-fontify-done-headline t)

(setq org-refile-targets
      '((nil :maxlevel . 1)
        ("~/src/doc/work.org" :maxlevel . 4)
        ("~/src/doc/home.org" :maxlevel . 4)))

(setq org-todo-keywords
      '("TODO" "BLOCK(b@/!)" "REVIEW(r@/!)" "WIP(w!)" "|" "DONE(d!)" "CANCELLED(c@)"))

(setq org-todo-interpretation 'sequence)

(setq org-todo-keyword-faces
      '(("BLOCK" .  (:foreground "CornflowerBlue"))
        ("REVIEW" . (:foreground "GoldenRod"))
        ("WAIT"  .  (:foreground "LightGoldenRod"))
        ("WIP"   .  (:foreground "LightGoldenRod"))))

(setq auto-mode-alist (rassq-delete-all 'dcl-mode auto-mode-alist)) ;no dcl for .com files
(setcdr (assoc "l" org-structure-template-alist) "src emacs-lisp")
