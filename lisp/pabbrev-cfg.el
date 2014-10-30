;; pabbrev from melpa

(autoload 'global-pabbrev-mode "pabbrev" nil t)

;; modes for which we want no pabbrev
(put 'inf-ruby 'pabbrev-global-mode-excluded-modes t)

;; use ido-mode to select suggestions
(eval-after-load "pabbrev"
  '(progn
     (setq pabbrev-minimal-expansion-p t) ;show minimal substring instead of most frequent
     (setq pabbrev-read-only-error nil)

     ;; in emacs 24.4. I see this, so write this as a defun instead of macro
     ;; remove this once the problem is figured out
     (defun pabbrev-debug-message(&rest body)
       `(if pabbrev-debug-enabled
            (let ((insert
                   (concat (format ,@body) "\n")))
              (with-current-buffer
                  (pabbrev-debug-get-buffer)
                (goto-char (point-max))
                (insert insert)
                (pabbrev-debug-frame-scroll)))))

     (defun pabbrev-suggestions-ido (suggestion-list)
       "Use ido to display menu of all pabbrev suggestions."
       (when suggestion-list
         (pabbrev-suggestions-insert-word pabbrev-expand-previous-word)
         (pabbrev-suggestions-insert-word
          (ido-completing-read "Completions: " (mapcar 'car suggestion-list)))))

     (defun pabbrev-suggestions-insert-word (word)
       "Insert word in place of current suggestion, with no attempt to kill pabbrev-buffer."
       (let ((point))
         (save-excursion
           (let ((bounds (pabbrev-bounds-of-thing-at-point)))
             (progn
               (delete-region (car bounds) (cdr bounds))
               (insert word)
               (setq point (point)))))
         (if point
             (goto-char point))))

     ;; use ido instead of selection buffer
     (fset 'pabbrev-suggestions-goto-buffer 'pabbrev-suggestions-ido)
     ))

;; turn it on
(global-pabbrev-mode)
