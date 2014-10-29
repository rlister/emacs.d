;; install world-time-mode from melpa
;; (autoload 'world-time-list "world-time-mode" nil t)
(defalias 'wt 'world-time-list)

(eval-after-load 'world-time-list
  '(progn
     (setq display-time-world-list '(
                                      ("UTC"                 "UTC")
                                      ("America/New_York"    "DC")
                                      ("Europe/Dublin"       "Dublin")
                                      ("Europe/Amsterdam"    "Amsterdam")
                                      ("Europe/Kiev"         "Kiev")
                                      ("Australia/Melbourne" "Melbourne")
                                      ("America/Los_Angeles" "San Francisco")
                                      ))))
