;; setup captures http://orgmode.org/org.html#Capture-_002d-Refile-_002d-Archive
(use-package org-protocol
  :bind (
         ("C-c c" . ric/org-capture-inbox)
         )
  )

(defun ric/org-capture-inbox ()
  "org-capture, select todo, and start evil insert state."
  (interactive)
  (org-capture nil "t")
  (evil-append-line 1))