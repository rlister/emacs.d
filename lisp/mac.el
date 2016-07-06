;; set vars for testing mac-i-ness
;; (setq darwin (cond ((equal system-type 'darwin) t)))
(setq cocoa (cond ((equal window-system 'ns) t)))

(when cocoa
  ;; (ns-set-resource nil "ApplePressAndHoldEnabled" "NO") ;; allow single-key repeats
  ;; (defalias 'fs 'ns-toggle-fullscreen)
  ;; (setq ns-antialias-text t)          ;AA
  ;; (setq ns-pop-up-frames 'nil)        ;no new frame when invoking Emacs.app
  (global-set-key (kbd "M-RET") 'toggle-frame-fullscreen)
  (setq ns-command-modifier 'meta)    ;Command key is Meta
  (setq ns-option-modifier 'super)    ;option key is Super
  (setq ns-function-modifier 'hyper)  ;fn key is Hyper
  (exec-path-from-shell-initialize)   ;from melpa
 )

;; share terminal emacs kill-ring with OSX clipboard
(when (eq system-type 'darwin)
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
