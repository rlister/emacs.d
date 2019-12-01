(use-package org
  :init
  (setq org-replace-disputed-keys 't
        org-use-speed-commands 't ;use speedkeys at start of headline (? for list of keys)
        org-startup-folded t      ;no expand all levels on opening file
        org-src-fontify-natively t
        org-directory "~/doc"
        org-refile-targets '(
                             (nil :maxlevel . 1)
                             ("~/doc/journalx.org" :maxlevel . 3)
                             ("~/doc/home.org"     :maxlevel . 3)
                             )
        org-fontify-done-headline t
        org-todo-keywords '("TODO" "WAIT" "WIP" "|" "DONE" "CANCELLED")
        org-todo-interpretation 'sequence
        org-todo-keyword-faces
        '(
          ;; ("TODO" .      (:foreground "IndianRed"      :weight 'normal))
          ;; ("STARTED" .   (:foreground "SalmonPink"     :weight 'normal))
          ;; ("APPT" .      (:foreground "LightGoldenRod" :weight 'normal))
          ("WAIT" .      (:foreground "LightGoldenRod"))
          ("WIP"  .      (:foreground "LightGoldenRod"))
          ;; ("CANCELLED" . (:foreground "PaleGreen"      :weight 'normal))
          ;; ("DEFERRED" .  (:foreground "yellow"         :weight 'normal))
          ;; ("DONE" .      (:foreground "ForestGreen"    :weight 'normal))
          )
        org-log-done 'time
        )
  :config
  (setq auto-mode-alist (rassq-delete-all 'dcl-mode auto-mode-alist)) ;no dcl for .com files
  :bind (
         :map org-mode-map
         ("C-," . ric/switch-project)
         ;; ("C-c p" . ric/org-convert-todo-to-project)
         ([C-return] . switch-to-buffer)
        )
  )

;; (defun ric/org-convert-todo-to-project ()
;;     "Convert a TODO item to a project with subheadings."
;;     (interactive)
;;     (org-todo "")
;;     (end-of-line)
;;     (insert " [/]")
;;     (open-line 1)
;;     (org-insert-todo-subheading nil)
;;   )

(defun om ()
  "Insert org magic at point and turn on org-mode."
  (interactive)
  (beginning-of-buffer)
  (insert "-*- mode: org; -*-\n\n")
  (org-mode))
