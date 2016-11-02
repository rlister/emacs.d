(use-package org
  :init
  (add-hook 'org-add-hook 'ric//modify-org-done-face)
  (setq org-replace-disputed-keys 't
        org-use-speed-commands 't ;use speedkeys at start of headline (? for list of keys)
        org-startup-folded t      ;no expand all levels on opening file
        org-src-fontify-natively t
        org-directory "~/notes"
        org-agenda-files '("~/notes/calendar.org" "~/notes/listers.org" "~/notes/inbox.org")
        ;; org-mobile-directory "~/Dropbox/Apps/MobileOrg"
        ;; org-mobile-inbox-for-pull "~/notes/Inbox.org"
        org-todo-keywords '("MTNG" "TODO" "TEST" "|" "DONE" "DUMP")
        org-todo-interpretation 'sequence
        org-todo-keyword-faces
        '(
          ("TODO" .      (:foreground "IndianRed"      :weight 'normal))
          ("STARTED" .   (:foreground "SalmonPink"     :weight 'normal))
          ("APPT" .      (:foreground "LightGoldenRod" :weight 'normal))
          ("WAIT" .      (:foreground "LightGoldenRod" :weight 'normal))
          ("CANCELLED" . (:foreground "PaleGreen"      :weight 'normal))
          ("DEFERRED" .  (:foreground "yellow"         :weight 'normal))
          ("DONE" .      (:foreground "ForestGreen"    :weight 'normal))
          )
        )
  :bind (
         :map org-mode-map
         ("C-c d" . org-cut-subtree)
        )
  )

(defun ric//modify-org-done-face ()
  (setq org-fontify-done-headline t)
  (set-face-attribute 'org-done nil :strike-through t)
  (set-face-attribute 'org-headline-done nil
                      :strike-through t
                      :foreground "#5f5f5f"))

(defun om ()
  "Insert org magic at point and turn on org-mode."
  (interactive)
  (beginning-of-buffer)
  (insert "-*- mode: org; -*-\n\n")
  (org-mode))

(defun inbox ()
  "Jump to GTD inbox."
  (interactive)
  (find-file "~/notes/inbox.org"))

;; (define-key org-agenda-mode-map (kbd "M->") 'org-agenda-later)
;; (define-key org-agenda-mode-map (kbd "M-<") 'org-agenda-earlier)