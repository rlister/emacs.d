(defface ric-dired-executable '((t (:foreground "PaleGreen"))) "Exe files in dired.")
(defvar  ric-dired-face-executable 'ric-dired-executable)

(add-hook
 'dired-mode-hook
 '(lambda ()
    (add-to-list 'dired-font-lock-keywords ;change face for executable files
                 (list dired-re-exe
                       '(".+" (dired-move-to-filename) nil (0 ric-dired-face-executable))))
    ;; visit files and dirs in same buffer
    ;; (define-key dired-mode-map (kbd "<return>")
    ;;   'dired-find-alternate-file) ; was dired-advertised-find-file
    ;; (define-key dired-mode-map (kbd "^")
    ;;   (lambda () (interactive) (find-alternate-file ".."))) ; was dired-up-directory
    ;; (define-key dired-mode-map [M-up]
    ;;   (lambda () (interactive) (find-alternate-file "..")))
    ))

(put 'dired-find-alternate-file 'disabled nil) ;no newbie hand-holding
                                        ;when I use 'a' to replace dired buffer

;; (require 'dired-x)

;; use wdired-mode to edit filenames in buffer with C-x C-q
(setq wdired-allow-to-change-permissions t) ;edit permission bits directly
(setq wdired-allow-to-redirect-links t)     ;edit symlinks
(setq wdired-confirm-overwrite t) ; ask to overwrite files if conflict

(require 'dired+)                     ;extra functionality below
;(diredp-toggle-find-file-reuse-dir 1) ;tell Dired to reuse Dired buffers
(setq diredp-hide-details-initially-flag nil) ;toggle with '('

;; melpa install dired-k
(require 'dired-k)
(define-key dired-mode-map (kbd "K") 'dired-k)
