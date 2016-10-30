;; (setq enh-ruby-bounce-deep-indent t)	;gold-dust ... hit tab to toggle deep and normal indent for blocks
;; (eval-after-load 'enh-ruby-mode
;;   '(progn
;;      (add-hook
;;       'enh-ruby-mode-hook
;;       (lambda ()
;;         ;; (ruby-end-mode) ;; built-in to enh-ruby-mode?
;;         (setq show-trailing-whitespace t)
;;         ;; (whitespace-cleanup-on-save)
;;         (highlight-indentation-current-column-mode)
;;         (inf-ruby-minor-mode)
;;         (define-key enh-ruby-mode-map (kbd "M-p") 'enh-ruby-backward-sexp)
;;         (define-key enh-ruby-mode-map (kbd "M-n") 'enh-ruby-forward-sexp)))))