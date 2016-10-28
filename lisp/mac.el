;; set vars for testing mac-i-ness
;; (setq darwin (cond ((equal system-type 'darwin) t)))
(setq cocoa (cond ((equal window-system 'ns) t)))

(when cocoa
  ;; (ns-set-resource nil "ApplePressAndHoldEnabled" "NO") ;; allow single-key repeats
  ;; (defalias 'fs 'ns-toggle-fullscreen)
  ;; (setq ns-antialias-text t)          ;AA
  ;; (setq ns-pop-up-frames 'nil)        ;no new frame when invoking Emacs.app
  (global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)
  (setq ns-auto-hide-menu-bar nil)
  (setq ns-command-modifier 'meta)    ;Command key is Meta
  (setq ns-option-modifier 'super)    ;option key is Super
  (setq ns-function-modifier 'hyper)  ;fn key is Hyper
  ;; (exec-path-from-shell-initialize)   ;from melpa
  (set-face-attribute 'default nil :family "Inconsolata" :height 140 :weight 'normal :width 'normal)
  )

;; share terminal emacs kill-ring with OSX clipboard
(when (eq system-type 'darwin)
  ;; 2016-09-20 update of gpg2 in brew installed:
  ;;   gnupg2: stable 2.0.30 (bottled)
  ;; which broke passwd prompt (now complains about ioctl)
  ;; as a workaround for now, install from https://gpgtools.org/
  ;; this integrates with keychain and gives graphical prompt
  ;; check back later for fix with gnupg
  (setq epg-gpg-program "/usr/local/MacGPG2/bin/gpg2")

  ;; fettle tmux cut and paste
  (unless (display-graphic-p)
    (when (and (> (length (getenv "TMUX")) 0) (executable-find "reattach-to-user-namespace"))

      (defun paste-from-osx ()
        (shell-command-to-string "reattach-to-user-namespace pbpaste") )

      (defun cut-to-osx (text &optional push)
        (let ((process-connection-type nil))
          (let ((proc (start-process "pbcopy" "*Messages*" "reattach-to-user-namespace" "pbcopy") ))
            (process-send-string proc text)
            (process-send-eof proc))))

      (setq interprogram-cut-function 'cut-to-osx)
      (setq interprogram-paste-function 'paste-from-osx))))