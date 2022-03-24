(define-key slack-mode-map (kbd "M-p") #'slack-buffer-goto-prev-message)
(define-key slack-mode-map (kbd "M-n") #'slack-buffer-goto-next-message)
(define-key slack-mode-map (kbd "@") #'slack-message-embed-mention)
(define-key slack-mode-map (kbd "#") #'slack-message-embed-channel)
(define-key slack-mode-map (kbd "C-c C-e") #'slack-message-edit)
(define-key slack-mode-map (kbd "C-c C-k") #'slack-message-delete)
(define-key slack-mode-map (kbd "C-c C-;") #'slack-insert-emoji)
(define-key slack-mode-map (kbd "C-c C-r") #'slack-message-add-reaction)
(define-key slack-mode-map (kbd "C-c C-y") #'slack-clipboard-image-upload)
(define-key slack-mode-map (kbd "C-c w") #'slack-message-write-another-buffer)
(define-key slack-mode-map (kbd "<C-return>") #'slack-thread-show-or-create)
;; (define-key slack-mode-map (kbd "C-c <return>") #'slack-thread-show-or-create)
;; (define-key slack-mode-map (kbd "<M-return>") #'slack-thread-show-or-create)
(define-key slack-message-buffer-mode-map (kbd "C-c C-c") #'ric/slack-update-mark)
(define-key slack-thread-message-buffer-mode-map (kbd "M-p") #'slack-buffer-goto-prev-message)
(define-key slack-thread-message-buffer-mode-map (kbd "M-n") #'slack-buffer-goto-next-message)
(define-key slack-thread-message-buffer-mode-map (kbd "@") #'slack-message-embed-mention)
(define-key slack-thread-message-buffer-mode-map (kbd "#") #'slack-message-embed-channel)
(define-key slack-thread-message-buffer-mode-map (kbd "C-c C-e") #'slack-message-edit)
(define-key slack-thread-message-buffer-mode-map (kbd "C-c C-k") #'slack-message-delete)
(define-key slack-thread-message-buffer-mode-map (kbd "C-c e") #'slack-insert-emoji)
(define-key slack-thread-message-buffer-mode-map (kbd "C-c C-r") #'slack-message-add-reaction)
(define-key slack-thread-message-buffer-mode-map (kbd "C-c C-y") #'slack-clipboard-image-upload)

(setq slack-render-image-p t)
(setq slack-buffer-emojify nil)
(setq slack-prefer-current-team t)
(setq slack-display-team-name nil) ;just channel etc name
(setq slack-buffer-function #'switch-to-buffer) ;use same window
(setq slack-modeline-count-only-subscribed-channel nil)
(setq slack-thread-also-send-to-room nil)
(setq lui-time-stamp-format "[%a %H:%M] ")
(setq lui-time-stamp-position 'left)

(slack-register-team
 :default t
 :name (plist-get (car (auth-source-search :host "slack")) :user)
 :token (auth-source-pick-first-password :host "slack")
 :display-profile-image nil
 :mark-as-read-immediately t
 :modeline-enabled t
 :modeline-name "ap"
 :visible-threads t
 :disable-block-format t)

;; remove user status and image
(defun slack-user-status (_id _team) "")

;; disable user images
(cl-defun slack-user-image (user team &optional (size 32)) nil)

;; shorten buffer names
(cl-defmethod slack-buffer-name ((this slack-message-buffer))
  (slack-if-let* ((team (slack-buffer-team this))
                  (room (slack-buffer-room this))
                  (room-name (slack-room-name room team)))
      (format "*Slack: %s*" room-name)))

;; implement https://github.com/yuya373/emacs-slack/pull/532 until merged upstream
;; so that we can load channels with a giphy image
;; (defclass slack-image-block-element (slack-block-element)
;;   ((type :initarg :type :type string :initform "image")
;;    (image-url :initarg :image_url :type string)
;;    (alt-text :initarg :alt_text :type string)
;;    (image-height :initarg :image_height :type (or number null))
;;    (image-width :initarg :image_width :type (or number null))
;;    (image-bytes :initarg :image_bytes :type (or number null))))

(defun ric/slack-update-mark ()
  "Force the read mark to the end of the channel."
  (interactive)
  (end-of-buffer)
  (slack-buffer-goto-prev-message)
  (slack-message-update-mark)
  (end-of-buffer))

(defun ric/kill-slack-message-buffers ()
  "Kill all slack message buffers."
  (interactive)
  (save-excursion
    (let ((count 0))
      (dolist (buffer (buffer-list))
        (set-buffer buffer)
        (when (equal major-mode 'slack-message-buffer-mode)
          (setq count (1+ count))
          (kill-buffer buffer)))
      (message "Killed %i slack buffers" count))))
