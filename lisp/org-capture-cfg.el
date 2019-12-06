;; setup captures http://orgmode.org/org.html#Capture-_002d-Refile-_002d-Archive
(use-package org-capture
  :init
  ;; (require 'org-protocol)               ;get protocol loaded
  (setq org-capture-templates
        '(
          ;; ("x" "store todo item from command line" entry (file+headline "~/notes/gtd/inbox.org" "Inbox")
          ;;  "* TODO %:link" :immediate-finish t)
          ("j" "Journal" entry (file+olp+datetree "~/doc/work.org")
           "* %<%H:%M> %?" :empty-lines 0 :tree-type week)
          ("t" "Todo" entry (file+olp+datetree "~/doc/work.org")
           "* TODO %?" :empty-lines 0 :tree-type week)
          ("m" "Meeting" entry (file+olp+datetree "~/doc/work.org")
           "* MTG %?" :empty-lines 0 :tree-type week)
          ("h" "Home" entry (file+olp+datetree "~/doc/home.org")
           "* TODO %?" :empty-lines 0 :tree-type week)
          )
        )
  :bind (
         :map global-map
         ("H-c" . org-capture)
         ("C-M-s-c" . org-capture)
         ("C-c c" . org-capture)
         ;;        ("C-c c" . ric/org-capture-inbox)
         )
  )

;; (defun ric/org-capture-inbox ()
;;   "org-capture, select todo, and start evil insert state."
;;   (interactive)
;;   (org-capture nil "t")
;;   (evil-append-line 1))