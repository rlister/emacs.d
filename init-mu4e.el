(setq user-full-name "Richard Lister")
(setq mu4e-change-filenames-when-moving t) ;important for mbsync
(setq mu4e-drafts-folder "/drafts")
(setq mu4e-sent-messages-behavior 'delete) ;do not save to Sent: gmail imap takes care of this
(setq mu4e-context-policy 'pick-first)     ;start with default context
(setq mu4e-main-buffer-name "*mu4e-main*") ;remove leading spc to unhide buffer

(setq mu4e-contexts
      `(
        ,(make-mu4e-context
          :name "home"
          :match-func (lambda (m) (when m (string-match-p "^/home" (mu4e-message-field m :maildir))))
          :vars '((user-mail-address . "rlister@gmail.com"  )
                  (mu4e-get-mail-command . "mbsync home")
                  (mu4e-sent-folder . "/home/[Gmail]/Sent Mail")
                  (mu4e-trash-folder . "/home/[Gmail]/Trash")
                  (mu4e-maildir-shortcuts . ((:maildir "/home/Inbox" :key ?i)
                                             (:maildir "/home/[Gmail]/Spam" :key ?s)
                                             (:maildir "/home/[Gmail]/Sent Mail" :key ?S)
                                             (:maildir "/home/[Gmail]/Trash" :key ?t)))))
        ,(make-mu4e-context
          :name "work"
          :match-func (lambda (m) (when m (string-match-p "^/work" (mu4e-message-field m :maildir))))
          :vars '((user-mail-address . "ric.lister@arcadia.com" )
                  (mu4e-get-mail-command . "mbsync work")
                  (mu4e-sent-folder . "/work/[Gmail]/Sent Mail")
                  (mu4e-trash-folder . "/work/[Gmail]/Trash")
                  (mu4e-maildir-shortcuts . ((:maildir "/work/Inbox" :key ?i)
                                             (:maildir "/work/[Gmail]/Sent Mail" :key ?S)
                                             (:maildir "/work/[Gmail]/Trash" :key ?t)))))))

(setq sendmail-program "/usr/bin/msmtp")
(setq send-mail-function 'smtpmail-send-it) ;do not query
(setq message-sendmail-f-is-evil t)         ;do not add username to cmdline
(setq message-sendmail-extra-arguments '("--read-envelope-from")) ;get cfg from sender
(setq message-send-mail-function 'message-send-mail-with-sendmail)
