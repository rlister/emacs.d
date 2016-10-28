;; use this to insert word from ivy completion
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

;; use ivy to choose between suggestions
(defun pabbrev-suggestions-ivy (suggestion-list)
  "Use ivy to display menu of all pabbrev suggestions."
  (when suggestion-list
    (pabbrev-suggestions-insert-word pabbrev-expand-previous-word)
    (pabbrev-suggestions-insert-word
     (ivy-completing-read "Pabbrev: " (mapcar 'car suggestion-list)))))

(use-package pabbrev
  :config
  ;; modes for which we want no pabbrev
  (put 'inf-ruby       'pabbrev-global-mode-excluded-modes t)
  (put 'erc-mode       'pabbrev-global-mode-excluded-modes t)
  (put 'mew-draft-mode 'pabbrev-global-mode-excluded-modes t)

  (setq pabbrev-idle-timer-verbose nil) ;no minibuffer messages about scavenging
  (setq pabbrev-minimal-expansion-p t) ;show minimal substring instead of most frequent
  (setq pabbrev-read-only-error nil)

  ;; change suggestions definition
  (fset 'pabbrev-suggestions-goto-buffer 'pabbrev-suggestions-ivy)

  (global-pabbrev-mode t)
  )