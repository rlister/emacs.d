;; org-mode
;;
;; for auto-decrypt of .gpg files use epa-file
;; for passwd-less save, create keypair using:
;;   gpg --gen-key
;; and add this to top of file:
;;   -*- mode:org; epa-file-encrypt-to: ("rlister@gmail.com") -*-

(autoload 'org "org" "org-mode" t)

(defun my/modify-org-done-face ()
  (setq org-fontify-done-headline t)
  (set-face-attribute 'org-done nil :strike-through t)
  (set-face-attribute 'org-headline-done nil
                      :strike-through t
                      :foreground "#5f5f5f"))

(eval-after-load "org"
  '(progn
     (add-hook 'org-add-hook 'my/modify-org-done-face)
     (setq org-replace-disputed-keys 't
           org-use-speed-commands 't ;use speedkeys at start of headline (? for list of keys)
           org-startup-folded t      ;no expand all levels on opening file
           org-src-fontify-natively t
           org-directory "~/notes"
           org-mobile-directory "~/Dropbox/Apps/MobileOrg"
           org-agenda-files '("~/notes/calendar.org" "~/notes/listers.org" "~/notes/inbox.org")
           org-mobile-inbox-for-pull "~/notes/Inbox.org"
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
           org-capture-templates
           '(("t" "Todo" entry (file+headline "~/notes/inbox.org" "Inbox")
              "* TODO %?\n  %i")
             ("x" "store todo item from command line" entry (file+headline "~/notes/inbox.org" "Inbox")
              ;; "* TODO %:link : %:description : %i" :immediate-finish t)
              "* TODO %:link" :immediate-finish t)
             ("b" "Bookmark" entry (file+headline "~/notes/bookmarks.org" "Bookmarks")
              "* %?\n  %i\n  %a")
             ("j" "Journal" entry (file+datetree "~/notes/journal.org" "Journal")
              "* %?\nEntered on %U\n  %i\n  %a"))
           )))


;; start org-mode and insert magic
(defun om ()
  "Insert org magic at point and turn on org-mode."
  (interactive)
  (beginning-of-buffer)
  (insert "-*- mode: org; -*-\n\n")
  (org-mode))

;; setup captures http://orgmode.org/org.html#Capture-_002d-Refile-_002d-Archive
(require 'org-protocol)
(define-key global-map "\C-cc" 'org-capture)
(define-key org-mode-map (kbd "C-c d") 'org-cut-subtree) ;delete item

;; (define-key org-agenda-mode-map (kbd "M->") 'org-agenda-later)
;; (define-key org-agenda-mode-map (kbd "M-<") 'org-agenda-earlier)