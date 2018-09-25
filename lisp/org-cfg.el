(use-package org
  :init
  (setq org-replace-disputed-keys 't
        org-use-speed-commands 't ;use speedkeys at start of headline (? for list of keys)
        org-startup-folded t      ;no expand all levels on opening file
        org-src-fontify-natively t
        org-directory "~/notes"
        org-refile-targets '(
                             (nil :maxlevel . 1)
                             ("~/notes/gtd/gtd.org" :maxlevel . 2)
                             ("~/notes/gtd/someday.org" :level . 1)
                             ("~/notes/gtd/tickler.org" :maxlevel . 2)
                             )
        org-agenda-files '(
                           "~/notes/gtd/inbox.org"
                           "~/notes/gtd/gtd.org"
                           "~/notes/gtd/tickler.org"
                           )
        org-fontify-done-headline t
        org-todo-keywords '("TODO" "WAIT" "|" "DONE" "CANCELLED")
        org-todo-interpretation 'sequence
        org-todo-keyword-faces
        '(
          ;; ("TODO" .      (:foreground "IndianRed"      :weight 'normal))
          ;; ("STARTED" .   (:foreground "SalmonPink"     :weight 'normal))
          ;; ("APPT" .      (:foreground "LightGoldenRod" :weight 'normal))
          ("WAIT" .      (:foreground "LightGoldenRod"))
          ;; ("CANCELLED" . (:foreground "PaleGreen"      :weight 'normal))
          ;; ("DEFERRED" .  (:foreground "yellow"         :weight 'normal))
          ;; ("DONE" .      (:foreground "ForestGreen"    :weight 'normal))
          )
        )
  :bind (
         :map org-mode-map
         ("C-c d" . org-cut-subtree)
         ("C-c a" . org-agenda)
         ("C-c p" . ric/org-convert-todo-to-project)
         ([C-return] . counsel-projectile-find-file)
         :map global-map
         ("M-i" . ric/org-inbox)
        )
  )

(defun ric/org-convert-todo-to-project ()
    "Convert a TODO item to a project with subheadings."
    (interactive)
    (org-todo "")
    (end-of-line)
    (insert " [/]")
    (open-line 1)
    (org-insert-todo-subheading nil)
  )

(defun om ()
  "Insert org magic at point and turn on org-mode."
  (interactive)
  (beginning-of-buffer)
  (insert "-*- mode: org; -*-\n\n")
  (org-mode))


(defun ric/org-inbox ()
  "Jump to GTD inbox."
  (interactive)
  (find-file "~/notes/gtd/inbox.org"))

;; (define-key org-agenda-mode-map (kbd "M->") 'org-agenda-later)
;; (define-key org-agenda-mode-map (kbd "M-<") 'org-agenda-earlier)