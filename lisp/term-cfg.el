;; tell term to kill buffer after shell process exit
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defun ric-term-toggle-line-char-mode ()
  "Switch to appropriate evil states with term mode changes."
  (interactive)
  (if (term-in-line-mode)
      (progn
        (term-char-mode)
        (evil-emacs-state)
        (term-send-raw-string ""))    ;back to prompt
    (progn
      (term-line-mode)
      (evil-normal-state))))

(defun ric-toggle-evil-state ()
  "My replacement for C-z to switch to emacs state, which is hard to re-bind."
  (interactive)
  (if (string= evil-state "emacs")
      (evil-normal-state)
    (evil-emacs-state)))

(defun ric-term-counsel-yank-pop ()
  "Send value of counsel-yank-pop to term correctly."
  (interactive)
  (term-send-raw-string (counsel-yank-pop)))

;; quick switcher between latest term and non-term buffers in a project
(defun ric-string-match-term (s)
  "Func to match term buffer names."
  (string-match "^term -" s))

(defun ric-project-term-buffers ()
  "List of term buffers in current project."
  (-filter 'ric-string-match-term (projectile-project-buffer-names)))

(defun ric-project-non-term-buffers ()
  "List of non-term buffers in current project."
  (-remove 'ric-string-match-term (projectile-project-buffer-names)))

(defun ric-project-term-buffer-switcher ()
  "Switch to/from latest term buffer."
  (interactive)
  (switch-to-buffer
   (if (ric-string-match-term (buffer-name))
       (car (ric-project-non-term-buffers))
     (car (ric-project-term-buffers)))))

(defun ric-all-term-buffers ()
  "List of all term buffers, regardless of project."
  (-filter 'ric-string-match-term (mapcar (function buffer-name) (buffer-list))))

(defun ric-switch-term ()
  "Like ivy-switch-buffer, but for term buffers only."
  (interactive)
  (ivy-read "Switch to term: " (ric-all-term-buffers)
            :action (lambda (x) (switch-to-buffer x))))

(global-set-key (kbd "C-z [") 'ric-term-toggle-line-char-mode)
(global-set-key (kbd "C-z e") 'ric-toggle-evil-state)
(global-set-key (kbd "C-z g") 'magit-status)
(global-set-key (kbd "C-z l") 'ric-project-term-buffer-switcher)
(global-set-key (kbd "C-x t") 'ric-switch-term)

;; allow some special keys in term-mode
(setq term-unbind-key-list '("C-z" "C-x" "M-x" "C-h" "C-c"))
(eval-after-load "term-mode"
  (add-hook 'term-mode-hook
            (lambda ()
              (toggle-truncate-lines)                   ;fix occasional extra newline before prompt
              (define-key term-raw-map (kbd "C-c") nil) ;make prefix in term-mode
              (define-key term-raw-map (kbd "C-z") nil) ;make prefix in term-mode
              (define-key term-raw-map (kbd "C-x") nil) ;make prefix in term-mode
              (define-key term-raw-map (kbd "C-h") nil) ;make prefix in term-mode
              (define-key term-raw-map (kbd "M-x") nil) ;make prefix in term-mode
              (define-key term-raw-map (kbd "C-c C-c") 'term-interrupt-subjob)
              (define-key term-raw-map (kbd "C-x m") 'counsel-M-x) ;term-mode is ignoring the global bind of this
              (define-key term-raw-map (kbd "C-y") 'term-paste) ;to make yank work properly
              (define-key term-raw-map (kbd "M-y") 'ric-term-counsel-yank-pop)
              ;; (add-to-list 'term-bind-key-alist '("C-z z" . term-send-ctrl-z))
              )
            )
  )