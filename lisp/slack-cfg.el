(use-package slack
  :commands (slack-start)
  :load-path "secret/"                  ;relative to .emacs.d
  :init
  (load-library "secret.el.gpg")
  (setq slack-completing-read-function #'ivy-completing-read)
  (setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  (setq slack-buffer-create-on-notify t)
  :bind
  ([f8] . tracking-next-buffer)
  ([C-f8] . slack-channel-select)
  ([M-f8] . slack-im-select)
  ([f9] . slack-message-embed-mention)
  :config
  (slack-register-team
   :default t
   :name ric-slack-team
   :token ric-slack-token
   :full-and-display-names t)
  (cl-defmethod slack-buffer-delete-overlay ((this slack-message-buffer)))
  (cl-defmethod slack-buffer-update-marker-overlay ((this slack-message-buffer)))
  )
