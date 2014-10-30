(add-hook 'js-mode-hook
          '(lambda ()
             (setq js-indent-level 2)
             ;; (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             ;; (local-set-key "\C-x\C-r" 'js-send-region)
             ;; (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
             ;; (local-set-key "\C-cb" 'js-send-buffer)
             ;; (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
             ;; (local-set-key "\C-cl" 'js-load-file-and-go)
             ;; (pretty-function)          ;use utf8 for function and lambda
             ))

;; js-comint
;; http://js-comint-el.sourceforge.net/
;; wget http://downloads.sourceforge.net/js-comint-el/js-comint.el
;; You can then run a Javascript REPL with M-x run-js and also send
;; portions of files by selecting them and then running M-x
;; send-region. Neat.
;; (require 'js-comint)

;; ;; use node as our repl
;; (add-to-list 'exec-path "~/local/node/bin")
;; (setq inferior-js-program-command "node")

;; (setq inferior-js-mode-hook
;;       (lambda ()
;;         ;; We like nice colors
;;         (ansi-color-for-comint-mode-on)
;;         ;; Deal with some prompt nonsense
;;         (add-to-list 'comint-preoutput-filter-functions
;;                      (lambda (output)
;;                        (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
;;                                                  (replace-regexp-in-string ".*1G.*3G" "node> " output))))))
