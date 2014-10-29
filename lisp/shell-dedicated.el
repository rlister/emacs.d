(defun generic-shell-dedicated-toggle (buffer-name shell-func)
  "Start small split window with shell, or kill it if exists. Call with shell buffer name and function to start shell."
  (let ((shell-buffer (get-buffer buffer-name)))
    (if (eq nil shell-buffer)
        (progn
          (split-window-below -15)
          (other-window 1)
          (funcall shell-func buffer-name))
      (kill-buffer-and-its-windows shell-buffer))))

(defun shell-dedicated-toggle (&optional name)
  "Toggle dedicated shell window, with optional NAME."
  (interactive)
  (let* ((bufname (or name "*shell*"))
         (shell-process (get-buffer-process bufname)))
    (unless (eq nil shell-process)
      (set-process-query-on-exit-flag shell-process nil)) ;do not ask to kill shell process
    (generic-shell-dedicated-toggle bufname 'shell)))

(defun inf-ruby-console-or-irb (&optional name)
  "Call inf-ruby-console, or inf-ruby if console has error, e.g. not in supported project."
  (condition-case err
      (inf-ruby-console-auto)
    (error (inf-ruby))))

;; TODO: set a perspective-local buffer name, and kill the right buffer on toggle
(defun inf-ruby-console-dedicated-toggle (&optional name)
  "Toggle dedicated ruby console window."
  (interactive)
  (generic-shell-dedicated-toggle "*pry*" 'inf-ruby-console-or-irb))

;; (defun start-eshell-with-smart ()
;;   "Start eshell and run em-smart to keep point on last command."
;;   (eshell)
;;   (eshell-smart-initialize))

;; (defun eshell-dedicated-toggle ()
;;   "Toggle dedicated eshell window."
;;   (interactive)
;;   (generic-shell-dedicated-toggle "*eshell*" 'start-eshell-with-smart))

;; (defun super-hacky-irb-with-working-completion ()
;;   "inf-ruby mode has busted completion for now, so hack it with term-mode."
;;   (term "irb")
;;   (rename-buffer "*irb*" t))

;; (defun irb-dedicated-toggle ()
;;   "Toggle dedicated irb window."
;;   (interactive)
;;   (generic-shell-dedicated-toggle "*irb*" 'super-hacky-irb-with-working-completion))

;; (defun inf-ruby-wrapper (&optional name)
;;   "Throw away arg and call inf-ruby."
;;   (inf-ruby))

;; (defun inf-ruby-dedicated-toggle ()
;;   "Toggle dedicated irb window."
;;   (interactive)
;;   (generic-shell-dedicated-toggle "*irb*" 'super-hacky-irb-with-working-completion))

;; swiped this from http://www.emacswiki.org/emacs/misc-cmds.el
(defun kill-buffer-and-its-windows (buffer)
  "Kill BUFFER and delete its windows.  Default is `current-buffer'.
BUFFER may be either a buffer or its name (a string)."
  (interactive (list (read-buffer "Kill buffer: " (current-buffer) 'existing)))
  (setq buffer  (get-buffer buffer))
  (if (buffer-live-p buffer)            ; Kill live buffer only.
      (let ((wins  (get-buffer-window-list buffer nil t))) ; On all frames.
        (when (and (buffer-modified-p buffer)
                   (fboundp '1on1-flash-ding-minibuffer-frame))
          (1on1-flash-ding-minibuffer-frame t)) ; Defined in `oneonone.el'.
        (when (kill-buffer buffer)      ; Only delete windows if buffer killed.
          (dolist (win  wins)           ; (User might keep buffer if modified.)
            (when (window-live-p win)
              ;; Ignore error, in particular, "Attempt to delete the sole visible or iconified frame".
              (condition-case nil (delete-window win) (error nil))))))
    (when (interactive-p)
      (error "Cannot kill buffer.  Not a live buffer: `%s'" buffer))))

;; (global-set-key (kbd "C-,") 'shell-dedicated-toggle) ; set in perspective-cfg now
(global-set-key (kbd "M-i") 'inf-ruby-console-dedicated-toggle)
