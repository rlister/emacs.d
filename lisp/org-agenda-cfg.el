(use-package org-agenda
  :init
  (setq org-agenda-files '(
                           "~/doc/journalx.org"
                           "~/doc/home.org"
                           )
        org-agenda-custom-commands '(
                                     ("w" "Agenda and work tasks"
                                      ((agenda "" ((org-agenda-span 7)
                                                   (org-agenda-start-on-weekday nil)))
                                       (tags-todo "work")))
                                     ("h" "Agenda and home tasks"
                                      ((agenda "" ((org-agenda-span 7)
                                                   (org-agenda-start-on-weekday nil)))
                                       (tags-todo "home")))
                                     ;; ((org-agenda-prefix-format " %i %-12:c %l"))
                                     ;; )))
                                     ;; (org-agenda-prefix-format)
                                     ;; Its value is
                                     ;; ((agenda . " %i %-12:c%?-12t% s")
                                     ;;  (todo . " %i %-12:c")
                                     ;;  (tags . " %i %-12:c")
                                     ;;  (search . " %i %-12:c"))
                                     )
        org-agenda-show-log t
        org-agenda-log-mode-items '(closed clock state)
        )
  :bind (
         :map org-agenda-mode-map
         ("e" . org-agenda-previous-line)
         :map global-map
         ;; ("M-i" . ric/org-inbox)
         ("H-a" . org-agenda)
         ("C-c a" . org-agenda)
        )
  )
