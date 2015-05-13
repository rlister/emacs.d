;; ;; wget https://raw.githubusercontent.com/syohex/emacs-emamux/master/emamux.el
;; (add-to-list 'load-path "~/etc/emacs/pkg/emamux")
;; (require 'emamux)

;; (global-set-key (kbd "C-z s") 'emamux:send-command)
;; (global-set-key (kbd "C-z y") 'emamux:yank-from-list-buffers) ;yank from tmux buffer
;; (global-set-key (kbd "C-z k") 'emamux:copy-kill-ring) ;copy kill-ring to tmux buffer

;; (defun emamux:switch-session ()
;;   "Kill tmux session"
;;   (interactive)
;;   (emamux:check-tmux-running)
;;   (let ((session (emamux:read-parameter-session)))
;;     (emamux:tmux-run-command nil "switch" "-t" session)))
