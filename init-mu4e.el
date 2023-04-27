(setq mu4e-change-filenames-when-moving t) ;important for mbsync
(setq mu4e-sent-messages-behavior 'delete) ;do not save to Sent: gmail imap takes care of this
(setq mu4e-context-policy 'pick-first)     ;start with default context
(setq mu4e-headers-thread-last-child-prefix '(" >" . "└ ")) ;nicer ascii char
(setq mu4e-headers-fields '((:human-date . 12) (:flags . 6) (:maildir . 15) (:mailing-list . 10) (:from-or-to . 22) (:subject)))
;; (setq mu4e-split-view 'single-window)

(setq mu4e-contexts
      `(,(make-mu4e-context
          :name "home"
          :match-func (lambda (m) (when m (string-match-p "^/home" (mu4e-message-field m :maildir))))
          :vars '((user-mail-address . "rlister@gmail.com"  )
                  (mu4e-get-mail-command . "mbsync home")
                  (mu4e-sent-folder . "/home/sent")
                  (mu4e-refile-folder . "/home/archive")
                  (mu4e-trash-folder . "/home/trash")
                  (mu4e-drafts-folder . "/home/drafts")
                  (mu4e-maildir-shortcuts . ((:maildir "/home/inbox" :key ?i) (:maildir "/home/spam" :key ?s) (:maildir "/home/sent" :key ?S) (:maildir "/home/trash" :key ?t)))))
        ,(make-mu4e-context
          :name "work"
          :match-func (lambda (m) (when m (string-match-p "^/work" (mu4e-message-field m :maildir))))
          :vars '((user-mail-address . "ric.lister@arcadia.com" )
                  (mu4e-get-mail-command . "mbsync work")
                  (mu4e-sent-folder . "/work/sent")
                  (mu4e-refile-folder . "/work/archive")
                  (mu4e-trash-folder . "/work/trash")
                  (mu4e-drafts-folder . "/work/drafts")
                  (mu4e-maildir-shortcuts . ((:maildir "/work/inbox" :key ?i) (:maildir "/work/spam" :key ?s) (:maildir "/work/sent" :key ?S) (:maildir "/work/trash" :key ?t)))))))

;; (define-key mu4e-main-mode-map (kbd "q") #'bury-buffer)
;; (define-key mu4e-main-mode-map (kbd "Q") #'mu4e-quit)
;; (define-key mu4e-main-mode-map (kbd "i") (kbd "ji"))

;; (define-key mu4e-headers-mode-map (kbd "c") #'mu4e-context-switch)
(define-key mu4e-view-mode-map (kbd "<backspace>") #'scroll-down)

;; borken
;; (advice-add 'mu4e-view-mark-for-trash :after #'kill-current-buffer)
