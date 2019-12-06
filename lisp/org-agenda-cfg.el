(use-package org-agenda
  :init
  (setq org-agenda-files '("~/doc/work.org" "~/doc/home.org"))
  (setq org-agenda-custom-commands
        '(
          ("c" "Composite agenda and todo"
           ((agenda "")
            (alltodo)))
          ("h" "Home tasks"
           agenda ""
           ((org-agenda-files '("~/doc/home.org"))
            (org-agenda-text-search-extra-files nil)))
          ("w" "Work tasks"
           agenda ""
           ((org-agenda-files '("~/doc/work.org"))
            (org-agenda-text-search-extra-files nil)))
          )
        )
  (setq org-agenda-show-log t)
  (setq org-agenda-log-mode-items '(closed clock state))
  :bind (
         :map org-agenda-mode-map
         ("e" . org-agenda-previous-line) ;colemak
         ("j" . org-agenda-next-line)     ;qwerty
         ("k" . org-agenda-previous-line) ;qwerty
         :map global-map
         ;; ("M-i" . ric/org-inbox)
         ("H-a" . org-agenda)
         ("C-c a" . org-agenda)
        )
  )
