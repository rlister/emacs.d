;; setup captures http://orgmode.org/org.html#Capture-_002d-Refile-_002d-Archive
(use-package org-capture
  :init
  (require 'org-protocol)               ;get protocol loaded
  (setq org-capture-templates
        '(
          ("t" "Todo" entry (file+headline "~/notes/gtd/inbox.org" "Inbox")
           "* TODO %?\n  %i")
          ("x" "store todo item from command line" entry (file+headline "~/notes/gtd/inbox.org" "Inbox")
           "* TODO %:link" :immediate-finish t)
          )
        )
  :bind (
         ("C-c c" . ric/org-capture-inbox)
         )
  )

(defun ric/org-capture-inbox ()
  "org-capture, select todo, and start evil insert state."
  (interactive)
  (org-capture nil "t")
  (evil-append-line 1))