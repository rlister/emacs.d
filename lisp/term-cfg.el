(use-package term
  :config
  (ad-activate 'term-sentinel)                                 ;for old-style defadvice
  (setq term-unbind-key-list '("C-z" "C-x" "M-x" "C-h" "C-c")) ;allow some special keys in term-mode
  :bind (
         ("C-z [" . ric/term-toggle-line-char-mode)
         ("C-z e" . ric/toggle-evil-state)
         :map term-raw-map
         ("C-c" . nil) ;make prefix in term-mode
         ("C-z" . nil) ;make prefix in term-mode
         ("C-x" . nil) ;make prefix in term-mode
         ("C-h" . nil) ;make prefix in term-mode
         ("M-x" . nil) ;make prefix in term-mode
         ("C-c C-c" . term-interrupt-subjob)
         ("C-x m" . counsel-M-x) ;term-mode is ignoring the global bind of this
         ("C-y" . term-paste) ;to make yank work properly
         ("M-y" . ric/term-counsel-yank-pop)
         ("M-,"     . counsel-projectile-switch-project)
         ))

;; tell term to kill buffer after shell process exit
;; TODO: replace this with new advice system for newer emacsen
;; e.g. wrap this in (when (version<= "24.4" emacs-version))
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))

;; TODO: this will replace defadvice for emacs >24.3
;; see https://www.gnu.org/software/emacs/manual/html_node/elisp/Porting-old-advice.html#Porting-old-advice
;; (defun ric//term-kill-buffer (proc msg)
;;   "Kill term buffer after shell process exit."
;;   (if (memq (process-status proc) '(signal exit))
;;       (let ((buffer (process-buffer proc)))
;;         ad-do-it
;;         (kill-buffer buffer))
;;     ))
;; (advice-add 'term-sentinel :around #'ric//term-kill-buffer)

(defun ric/term-toggle-line-char-mode ()
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

(defun ric/toggle-evil-state ()
  "My replacement for C-z to switch to emacs state, which is hard to re-bind."
  (interactive)
  (if (string= evil-state "emacs")
      (evil-normal-state)
    (evil-emacs-state)))

(defun ric/term-counsel-yank-pop ()
  "Send value of counsel-yank-pop to term correctly."
  (interactive)
  (term-send-raw-string (counsel-yank-pop)))

;; (eval-after-load "term-mode"
;;   (add-hook 'term-mode-hook
;;             (lambda ()
;;               (toggle-truncate-lines)                   ;fix occasional extra newline before prompt
;;               ;; (add-to-list 'term-bind-key-alist '("C-z z" . term-send-ctrl-z))
;;               )
;;             )
;;   )