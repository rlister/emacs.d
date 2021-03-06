;; fix 4m in prompt with:
;; tic -o ~/.terminfo /usr/local/Cellar/emacs/24.4/share/emacs/24.4/etc/e/eterm-color.ti

;; installed from melpa
(setq multi-term-scroll-to-bottom-on-output nil)
(setq multi-term-program "/bin/zsh")

(setq multi-term-switch-after-close nil) ;do not switch to next terminal on when killing term

(global-set-key (kbd "C-z") nil)             ;make C-z a prefix key so we can get all tmux-y
(global-set-key (kbd "C-z c") 'multi-term)   ;start a term from anywhere

;; C-z e
;; (defun term-send-esc ()
;;   "Send ESC in term mode."
;;   (interactive)
;;   (term-send-raw-string "\e"))

(defun term-send-ctrl-z ()
  "Allow using ctrl-z to suspend in multi-term shells."
  (interactive)
  (term-send-raw-string ""))

(defun term-toggle-line-char-mode ()
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

;; (defun kill-ring-save-switch-to-char-mode (b e)
;;   "In line-mode, M-w also switches back to char-mode and goes back to prompt."
;;   (interactive "r")
;;   (kill-ring-save b e t)
;;   (when (term-in-line-mode)
;;     (term-char-mode)
;;     (term-send-raw-string "")))

(add-hook 'term-mode-hook
          (lambda ()
            (setq term-eol-on-send nil) ;allows me to hit return in middle of command and not have duplicate content sent to shell
            (define-key term-raw-map (kbd "C-y")   'term-paste) ;to make yank work properly
            (define-key term-raw-map (kbd "M-DEL") 'term-send-raw-meta) ;actually kill in shell instead of just buffer
            (define-key term-raw-map (kbd "M-d")   'term-send-raw-meta) ;ditto
            (define-key term-raw-map (kbd "M-b")   'term-send-backward-word) ;ditto
            (add-to-list 'term-bind-key-alist '("C-z z" . term-send-ctrl-z))
            (add-to-list 'term-bind-key-alist '("C-z [" . term-toggle-line-char-mode)) ;char-mode
            (define-key term-mode-map (kbd "C-z [")      'term-toggle-line-char-mode)  ;line-mode
            (define-key term-mode-map (kbd "<return>")      'ric/term-toggle-line-char-mode)  ;line-mode
            (add-to-list 'term-bind-key-alist '("C-z C-z" . term-toggle-line-char-mode))
            ;; (add-to-list 'term-bind-key-alist '("M-,"     .'ric-multi-term-dedicated-toggle))
            )) ;make this work in line mode

;; experimental so far
;; (defun multi-term-dedicated-toggle ()
;;   "Toggle multi-term dedicated buffer, switch to it when creating."
;;   (interactive)
;;   (if (get-buffer "*MULTI-TERM-DEDICATED*")
;;       (progn
;;         (multi-term-dedicated-close)
;;         (kill-buffer "*MULTI-TERM-DEDICATED*"))
;;     (multi-term-dedicated-open)))

;; char mode is raw shell input, line-mode is moving around like a normal emacs buffer
;; set in global map so it works in line-mode
(global-set-key (kbd "C-z [") 'term-toggle-line-char-mode)

;; override the default version to work correctly on
;; localhost, and with tramp
(defun term-handle-ansi-terminal-messages (message)
  (while (string-match "\eAnSiT.+\n" message)
    ;; Extract the command code and the argument.
    (let* ((start (match-beginning 0))
           (command-code (aref message (+ start 6)))
           (argument
            (save-match-data
              (substring message
                         (+ start 8)
                         (string-match "\r?\n" message
                                       (+ start 8))))))
      ;; Delete this command from MESSAGE.
      (setq message (replace-match "" t t message))

      (cond ((= command-code ?c)
             (setq term-ansi-at-dir argument))
            ((= command-code ?h)
             (setq term-ansi-at-host argument))
            ((= command-code ?u)
             (setq term-ansi-at-user argument))
            ((= command-code ?e)
             (save-excursion
               (find-file-other-window argument)))
            ((= command-code ?x)
             (save-excursion
               (find-file argument))))))

  (when (and term-ansi-at-host term-ansi-at-dir term-ansi-at-user)
    ;; (setq buffer-file-name
    ;;       (format "%s@%s:%s" term-ansi-at-user term-ansi-at-host term-ansi-at-dir))
    (setq buffer-file-name
          (format "%s" term-ansi-at-dir))
    (set-buffer-modified-p nil)
    (setq default-directory (if (string= term-ansi-at-host (system-name))
                                (concatenate 'string term-ansi-at-dir "/")
                              ;; (format "/%s@%s:%s/" term-ansi-at-user term-ansi-at-host term-ansi-at-dir))))
                              (format "%s/" term-ansi-at-dir))))
  message)

;; different cursor for line and char mode
(defun multi-term-set-cursor-according-to-mode ()
  "Change cursor type according to multi-term mode."
  (cond
   ((term-in-char-mode)
    (setq cursor-type 'hbar))
   (t
    (setq cursor-type 'bar))))

(eval-after-load "multi-term"
  '(progn
     (add-hook 'post-command-hook 'multi-term-set-cursor-according-to-mode)))

;; experiment to render unicode ... does it work?
;; (defadvice ansi-term (after advise-ansi-term-coding-system)
;;     (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
;; (ad-activate 'ansi-term)
(set-terminal-coding-system 'utf-8-unix)
(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))
