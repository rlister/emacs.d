;; set vars for testing mac-i-ness
;; (setq darwin (cond ((equal system-type 'darwin) t)))
(setq cocoa (cond ((equal window-system 'ns) t)))

(when cocoa
  (ns-set-resource nil "ApplePressAndHoldEnabled" "NO") ;; allow single-key repeats
  (defalias 'fs 'ns-toggle-fullscreen)
  (setq ns-antialias-text t)          ;AA
  (setq ns-pop-up-frames 'nil)        ;no new frame when invoking Emacs.app
  (setq ns-command-modifier 'meta)    ;Command key is Meta
  (setq ns-option-modifier 'super)    ;option key is Super
  (setq ns-function-modifier 'hyper)  ;fn key is Hyper
  )
