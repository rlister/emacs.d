;; from https://github.com/the-kenny/weechat.el/issues/87
(defun weechat-return ()
  "Return key action.
If point is in input field send message.  If the point is in a chat line
copy the message.  Only the message text is copied unless the prefix argument
is given (\\[universal-argument])."
  (interactive)
  (cond
   ;; Submit
   ((>= (point) weechat-prompt-end-marker)
    (let ((input (weechat-get-input)))
      (unless (s-blank? input)
        ;; DO NOT Split multiple lines and send one-by-one
        ; (cl-dolist (l (split-string input "\n"))
	      (cl-dolist (l (list (replace-regexp-in-string "\n" "\r" input))) ;;(split-string input "\n"))

          ;; Pipe the input through the message filter system
          (let ((piped-input (weechat-pipe-input l)))
            (when (stringp piped-input)
              (if (and (not (s-equals? piped-input l))
                       weechat-message-filter-require-double-ret)
                  ;; Either filtered text is unchanged or we don't want double-ret anyway
                  (progn
                    ;; Replace text in-place and display a message
                    (weechat-replace-input piped-input)
                    (message "Input text was filtered..."))
                ;; No change, just send it
                (weechat-send-input weechat-buffer-ptr piped-input)
                (weechat-replace-input "")))))
        (weechat-input-ring-insert input))))

   ;; Copy current line to input line
   ((< (point) weechat-prompt-start-marker)
    (when (or (s-blank? (weechat-get-input))
              weechat-return-always-replace-input)
      (weechat-replace-input
       (buffer-substring-no-properties
        (if current-prefix-arg
            (point-at-bol)
          (+ (point-at-bol) weechat-text-column))
        (point-at-eol))))
    (goto-char (point-max)))))
