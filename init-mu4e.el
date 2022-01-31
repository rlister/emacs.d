(setq user-full-name "Richard Lister")
(setq mu4e-change-filenames-when-moving t) ;important for mbsync
(setq mu4e-sent-messages-behavior 'delete) ;do not save to Sent: gmail imap takes care of this
(setq mu4e-context-policy 'pick-first)     ;start with default context
(setq mu4e-main-buffer-name "*mu4e-main*") ;remove leading spc to unhide buffer
(setq mu4e-headers-thread-last-child-prefix '("\\>" . "└ ")) ;nicer ascii char
(setq mu4e-completing-read-function 'completing-read) ;default is ido for some reason

(setq mu4e-contexts
      `(
        ,(make-mu4e-context
          :name "home"
          :match-func (lambda (m) (when m (string-match-p "^/home" (mu4e-message-field m :maildir))))
          :vars '((user-mail-address . "rlister@gmail.com"  )
                  (mu4e-get-mail-command . "mbsync home")
                  (mu4e-sent-folder . "/home/sent")
                  (mu4e-refile-folder . "/home/archive")
                  (mu4e-trash-folder . "/home/trash")
                  (mu4e-drafts-folder . "/home/drafts")
                  (mu4e-maildir-shortcuts . ((:maildir "/home/inbox" :key ?i)
                                             (:maildir "/home/spam" :key ?s)
                                             (:maildir "/home/sent" :key ?S)
                                             (:maildir "/home/trash" :key ?t)))))
        ,(make-mu4e-context
          :name "work"
          :match-func (lambda (m) (when m (string-match-p "^/work" (mu4e-message-field m :maildir))))
          :vars '((user-mail-address . "ric.lister@arcadia.com" )
                  (mu4e-get-mail-command . "mbsync work")
                  (mu4e-sent-folder . "/work/[Gmail]/Sent Mail")
                  (mu4e-refile-folder . "/work/[Gmail]/archive")
                  (mu4e-trash-folder . "/work/[Gmail]/Trash")
                  (mu4e-drafts-folder . "/work/drafts")
                  (mu4e-maildir-shortcuts . ((:maildir "/work/Inbox" :key ?i)
                                             (:maildir "/work/[Gmail]/Sent Mail" :key ?S)
                                             (:maildir "/work/[Gmail]/Trash" :key ?t)))))))

(setq sendmail-program "/usr/bin/msmtp")
(setq send-mail-function 'smtpmail-send-it) ;do not query
(setq message-sendmail-f-is-evil t)         ;do not add username to cmdline
(setq message-sendmail-extra-arguments '("--read-envelope-from")) ;get cfg from sender
(setq message-send-mail-function 'message-send-mail-with-sendmail)
