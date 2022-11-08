(add-hook 'org-agenda-mode-hook #'hl-line-mode)
(add-hook 'org-agenda-after-show-hook #'org-narrow-to-subtree)

(setq org-agenda-window-setup 'current-window)
(setq org-agenda-custom-commands
      '(("b" "Backlog" alltodo "" ((org-agenda-files '("work.org"))))
        ("g" "Report" agenda "" ((org-agenda-files '("work.org")) (org-agenda-prefix-format "")))
        ("h" "Home" ((agenda "") (alltodo "")) ((org-agenda-files '("home.org"))))
        ("n" "Next" tags "next" ((org-agenda-files '("work.org"))))
        ("w" "Work" agenda "" ((org-agenda-files '("work.org"))))))
