;; shell out and run slackcat to send region to slack as text snippet
;; git clone https://github.com/rlister/slackcat
;; bundle install
;;
;; set env vars SLACK_TOKEN and SLACK_CHANNELS to configure

(defvar slackcat-bin  "~/code/slackcat/bin/slackcat" "Command to invoke slackcat.")
(defvar slackcat-args "-c dev"                       "Default arguments to pass to slackcat.")

(defun slackcat (&optional b e)
  "Upload contents of region to slack chat."
  (interactive "r")
  (let ((args (read-from-minibuffer "slackcat args: " slackcat-args)))
    (shell-command-on-region b e (format "%s %s" slackcat-bin args))))
