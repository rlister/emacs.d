(add-hook 'org-agenda-mode-hook 'hl-line-mode)
(add-hook 'org-agenda-after-show-hook #'org-narrow-to-subtree)

(setq org-agenda-window-setup 'current-window)
(setq org-agenda-files '("~/src/doc/work.org" "~/src/doc/home.org"))

(setq org-agenda-custom-commands
      '(("g" "Geekbot"
         agenda ""
         ((org-agenda-files '("~/src/doc/work.org"))
          (org-agenda-overriding-header "Standup")
          (org-agenda-show-log t)
          (org-agenda-todo-keyword-format "- %-4s")
          (org-agenda-remove-tags t)
          (org-agenda-prefix-format "")))
        ("c" "Composite agenda and todo"
         ((agenda "")
          (alltodo)))
        ("h" "Home tasks"
         ((agenda "" ((org-agenda-files '("~/src/doc/home.org"))))
          (alltodo "" ((org-agenda-files '("~/src/doc/home.org"))))))
        ("s" "Music"
         ((agenda "" ((org-agenda-files '("~/src/doc/music.org"))))
          (alltodo "" ((org-agenda-files '("~/src/doc/music.org"))))))
        ("w" "Work tasks"
         ((agenda "" ((org-agenda-files '("~/src/doc/work.org"))))
          (alltodo "" ((org-agenda-files '("~/src/doc/work.org"))))))
        ;; ("w" "Work tasks"
        ;;  ((agenda ""
        ;;           ((org-agenda-files '("~/src/doc/work.org" "~/.org-jira/"))
        ;;            (org-agenda-text-search-extra-files nil)))
        ;;   (alltodo ""
        ;;            ((org-agenda-files '("~/.org-jira/"))))))
        ))

(define-key org-agenda-mode-map (kbd "C-<down>") #'org-agenda-next-date-line)
(define-key org-agenda-mode-map (kbd "C-<up>") #'org-agenda-previous-date-line)
