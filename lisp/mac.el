;; set vars for testing mac-i-ness
(setq ric-darwin-p (cond ((equal system-type   'darwin) t)))
(setq ric-cocoa-p  (cond ((equal window-system 'ns) t)))

(when ric-cocoa-p
  (setq ns-auto-hide-menu-bar nil)
  (setq ns-command-modifier 'control)
  (setq ns-right-command-modifier 'control)
  (setq ns-option-modifier 'meta)
  (setq ns-control-modifier 'control)
  (setq ns-function-modifier 'hyper)
  ;; (exec-path-from-shell-initialize)   ;from melpa
  (set-face-attribute 'default nil :family "Roboto Mono" :height 140 :weight 'normal :width 'normal)


  ;; fix tmux cut and paste in terminal
  (when ric-darwin-p
    (unless (display-graphic-p)
      (when (and (> (length (getenv "TMUX")) 0) (executable-find "reattach-to-user-namespace"))

        (defun ric//cut-to-osx (text &optional push)
          (let ((process-connection-type nil))
            (let ((proc (start-process "pbcopy" "*Messages*" "reattach-to-user-namespace" "pbcopy") ))
              (process-send-string proc text)
              (process-send-eof proc))))

        (defun ric//paste-from-osx ()
          (shell-command-to-string "reattach-to-user-namespace pbpaste") )

        (setq interprogram-cut-function   'ric//cut-to-osx)
        (setq interprogram-paste-function 'ric//paste-from-osx)))))