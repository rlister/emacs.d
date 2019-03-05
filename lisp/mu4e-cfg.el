(use-package mu4e
  :load-path "/usr/share/emacs/site-lisp/mu4e"
  :init
  (setq
   mu4e-get-mail-command "offlineimap"  ;or fetchmail, or ...
   mu4e-update-interval 300             ;update every 5 minutes
   mu4e-sent-messages-behavior 'delete  ;do not save messages to Sent Messages, Gmail/IMAP takes care of this
   )
  )