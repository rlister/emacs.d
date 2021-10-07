;; ;; repo "ahungry/org-jira"
;; ;; commands (org-jira-get-issue org-jira-get-issues
;; (with-eval-after-load 'org-jira
;;   (let ((url (plist-get (nth 0 (auth-source-search :host "atlassian.net" :max 1 t)) :url)))
;;     (setq jiralib-url url)))
