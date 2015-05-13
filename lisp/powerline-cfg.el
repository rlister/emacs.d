;;;###autoload
(defun powerline-ric-nano-theme ()
  "Setup a Ric mode-line."
  (interactive)
  (setq-default
   mode-line-format
   '("%e"
     (:eval
      (let* ((active (powerline-selected-window-active))
             (lhs (list (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
                        (powerline-raw "[" mode-line 'l)
                        (powerline-major-mode mode-line)
                        (powerline-process mode-line)
                        (powerline-raw "]" mode-line)
                    ))
             (rhs (list (if (buffer-modified-p) (powerline-raw "Modified" nil 'r))))
             (center (list (powerline-raw "%b" nil))))
        (concat (powerline-render lhs)
                (powerline-fill-center nil (/ (powerline-width center) 2.0))
                (powerline-render center)
                (powerline-fill nil (powerline-width rhs))
                (powerline-render rhs)))))))


;;;###autoload
(defun powerline-ric-theme ()
  "Setup Ric mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (lhs (list
                                (powerline-raw (format "[%s]" (projectile-project-name)) face1)
                                (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
                                (when buffer-read-only
                                  (powerline-raw " [ro]" mode-line))
                                (when (and (boundp 'which-func-mode) which-func-mode)
                                  (powerline-raw which-func-format nil 'l))
                                (when (and vc-mode buffer-file-name)
                                  (let ((backend (vc-backend buffer-file-name)))
                                    (when backend
                                      (powerline-raw (format " %s:%s" backend (vc-working-revision buffer-file-name backend))))))))
                          (rhs (list
                                (when (buffer-modified-p)
                                  (powerline-raw "Modified" mode-line))
                                (powerline-raw " ")
                                (powerline-major-mode mode-line)
                                (powerline-process mode-line)
                                (powerline-raw "%l,%c" mode-line 'l)
                                )))
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))

;; select the one we want
(powerline-ric-theme)
