;; popup small window split with various kinds of shells and inf processes

(defcustom ric-mini-shell-size -15
  "Size of mini window. -ve is size of shell, +ve is size of upper, original window."
  :type 'integer
  :group 'ric-mini-shell)

;; (defun generic-shell-dedicated-toggle (buffer-name shell-func)
(defun ric//mini-shell-generic (buffer-name shell-func)
  "Start small split window with shell, or kill it if exists. Call with shell buffer name and function to start shell."
  (let ((shell-buffer (get-buffer buffer-name)))
    (if (eq nil shell-buffer)
        (progn
          (split-window-below ric-mini-shell-size)
          (other-window 1)
          (funcall shell-func buffer-name))
      (ric/kill-buffer-and-its-windows shell-buffer))))

;; (defun shell-dedicated-toggle (&optional name)
(defun ric/mini-shell (&optional name)
  "Toggle mini shell window, with optional NAME."
  (interactive)
  (let* ((bufname (or name "*shell*"))
         (shell-process (get-buffer-process bufname)))
    (unless (eq nil shell-process)
      (set-process-query-on-exit-flag shell-process nil)) ;do not ask to kill shell process
    (ric//mini-shell-generic bufname 'shell)))

(defun ric/mini-eshell ()
  "Toggle mini eshell window."
  (interactive)
  (ric//mini-shell-generic "*eshell*" 'eshell))

(defun ric//inf-ruby-console-or-irb (&optional name)
  "Call inf-ruby-console, or inf-ruby if console has error, e.g. not in supported project."
  (condition-case err
      (inf-ruby-console-auto)
    (error (inf-ruby))))

;; TODO: kill the right buffer on toggle
(defun ric/mini-shell-inf-ruby (&optional name)
  "Toggle dedicated ruby console window."
  (interactive)
  (ric//mini-shell-generic "*pry*" 'ric//inf-ruby-console-or-irb))

;; swiped this from http://www.emacswiki.org/emacs/misc-cmds.el
(defun ric/kill-buffer-and-its-windows (buffer)
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

(provide 'ric-mini-shell)