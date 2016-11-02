(use-package shell
  :init
  (setq comint-process-echoes t)        ;do not echo command
  :bind (
         :shell-mode-map
         ("C-a" . mwim-beginning-of-code-or-line)
         )
  )

;; ;; below uses ido for dir completion in shell
;; ;; from http://stackoverflow.com/questions/20952995/emacs-shell-change-directory-with-ido
;; ;; (require 'ido)
;; (require 'cl-lib)
;; (require 'shell)

;; (defvar my-dir-selected nil "Flag to indicate that user has selected the directory")

;; (defun my-filter-cd-input (current-input)
;;   "Takes current user input for `cd' the a list
;;     whose car is the 'maximum possible directory path'
;;     and cdr is remaining string.

;;     Examples:
;;     '~/.emacs.d/in => ('~./emacs.d/' 'in')
;;     '/home/gue' => ('/home/' 'gue')
;;     '~/../' => ('~/../' '')"
;;   (let* ((unquoted-input (shell-unquote-argument current-input))
;;      (components (split-string unquoted-input "/"))
;;          (directory-parts (butlast components))
;;          (possible-prefix (car (last components))))
;;     (list (if (string= possible-prefix "")
;;               unquoted-input
;;             (concat (mapconcat 'identity directory-parts "/")
;;                     (when directory-parts "/")))
;;           possible-prefix)))

;; (defun my-complete-directory-name (directory current-input)
;;   "Prompts user for directories in `directory', `current-input'
;;     is the string entered by the user till now"
;;   (let* ((filtered-input (my-filter-cd-input current-input))
;;          (directory-path (car filtered-input))
;;          (partial-input (cadr filtered-input))
;;          (directory-choices (mapcar 'file-name-nondirectory
;;                                     (condition-case nil
;;                                         (cl-remove-if-not 'file-directory-p
;;                                                           (directory-files (concat directory directory-path) t))
;;                                       ('file-error (list)))))
;;          (selected-name (ido-completing-read "Directory: "
;;                                              directory-choices
;;                                              nil nil partial-input)))
;;     (comint-delete-input)
;;     (insert (concat "cd "
;;             (shell-quote-argument (concat directory-path selected-name "/"))))))

;; (defun my-prompt-for-dir-or-fallback ()
;;   "If current shell command is `cd' prompt for directory
;;     using ido otherwise fallback to normal completion"
;;   (interactive)
;;   (let* ((user-input (buffer-substring-no-properties (comint-line-beginning-position)
;;                                                      (point-max))))
;;     (if (and (>= (length user-input) 3)
;;              (string= (substring user-input 0 3) "cd "))
;;         (progn
;;           (setq my-dir-selected nil)
;;           (while (not my-dir-selected)
;;             (my-complete-directory-name default-directory
;;                     (buffer-substring-no-properties (+ (comint-line-beginning-position) 3)
;;                                     (point-max))))
;;           (comint-send-input))
;;       (call-interactively 'completion-at-point))))

;; (define-key shell-mode-map (kbd "<tab>") 'my-prompt-for-dir-or-fallback)

;; (add-hook 'ido-setup-hook 'ido-my-keys)

;; (defun ido-my-keys ()
;;   "Add my keybindings for ido."
;;   (define-key ido-completion-map (kbd "<C-return>") (lambda ()
;;                                                         (interactive)
;;                                                         (setq my-dir-selected t)
;;                                                         (ido-exit-minibuffer))))