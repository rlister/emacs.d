(defun ric//use-gnu-ls ()
  "Find and set gnu ls on macs with homebrew."
  (let ((gls-path "/usr/local/bin/gls"))
    (when (and ric-darwin-p (file-exists-p gls-path))
      (setq insert-directory-program gls-path))))

(use-package dired
  :init
  (ric//use-gnu-ls)
  (put 'dired-find-alternate-file 'disabled nil) ;no newbie hand-holding for 'a'
  (defalias 'd 'dired-jump)
  :config
  (define-key dired-mode-map (kbd "C-o") 'counsel-projectile-find-file) ;neeeded after package load
  :bind
  ("C-x d" . dired-jump)       ;dwim entering dired
  ("C-x D" . dired)            ;legacy
  )

;; (defface ric-dired-executable '((t (:foreground "PaleGreen"))) "Exe files in dired.")
;; (defvar  ric-dired-face-executable 'ric-dired-executable)

;; (add-hook
;;  'dired-mode-hook
;;  '(lambda ()
;;     (add-to-list 'dired-font-lock-keywords ;change face for executable files
;;                  (list dired-re-exe
;;                        '(".+" (dired-move-to-filename) nil (0 ric-dired-face-executable))))

;; visit files and dirs in same buffer
;; (define-key dired-mode-map (kbd "<return>")
;;   'dired-find-alternate-file) ; was dired-advertised-find-file
;; (define-key dired-mode-map (kbd "^")
;;   (lambda () (interactive) (find-alternate-file ".."))) ; was dired-up-directory
;; (define-key dired-mode-map [M-up]
;;   (lambda () (interactive) (find-alternate-file "..")))

;; (put 'dired-find-alternate-file 'disabled nil)