;; 2016-09-20 update of gpg2 in brew installed:
;;   gnupg2: stable 2.0.30 (bottled)
;; which broke passwd prompt (now complains about ioctl)
;; as a workaround for now, install from https://gpgtools.org/
;; this integrates with keychain and gives graphical prompt
;; check back later for fix with gnupg

;; 2017-10-13 updated gnupg2 2.2.1, but problem appears to
;; be with default pinentry 1.1.0, which has same error.
;; Workaround is to brew install pinentry-mac, and point
;; to it in ~/.gnupg/gpg-agent.conf:
;;   /usr/local/bin/pinentry-mac
;; and pkill -SIGHUP gpg-agent

(use-package epa
  :init
  (when ric-darwin-p
    ;; (setq epg-gpg-program "/usr/local/MacGPG2/bin/gpg2"))
    (custom-set-variables '(epg-gpg-program  "/usr/local/bin/gpg")))
    ;; (setq epg-gpg-program "/usr/local/bin/gpg"))
  )