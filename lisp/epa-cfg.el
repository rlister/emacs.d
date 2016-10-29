;; 2016-09-20 update of gpg2 in brew installed:
;;   gnupg2: stable 2.0.30 (bottled)
;; which broke passwd prompt (now complains about ioctl)
;; as a workaround for now, install from https://gpgtools.org/
;; this integrates with keychain and gives graphical prompt
;; check back later for fix with gnupg
(use-package epa
  :init
  (when ric/darwin-p
    (setq epg-gpg-program "/usr/local/MacGPG2/bin/gpg2"))
  )