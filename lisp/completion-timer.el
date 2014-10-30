;; make completion buffers disappear after a few seconds
(add-hook
 'completion-setup-hook
 (lambda ()
   (run-at-time
    60 nil
    (lambda ()
      (delete-windows-on "*Completions*")))))
