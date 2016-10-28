(defalias 'irb 'inf-ruby)
(defalias 'console 'inf-ruby-console-auto)

(defun pry ()
  (interactive)
  (inf-ruby "pry"))

;; (add-to-list 'auto-mode-alist '("Procfile$"   . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.rb$"      . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.thor$"    . ruby-mode))
;; (add-to-list 'auto-mode-alist '("Berksfile$"  . ruby-mode))
;; (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(eval-after-load 'ruby-mode
  '(progn
     (add-hook
      'ruby-mode-hook
      (lambda ()
        ;; (pretty-lambda)                 ;utf-8 lambda
        ;; (ruby-end-mode)                 ;from melpa
        ;; (whitespace-cleanup-on-save)
        (setq show-trailing-whitespace t)))))

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

;; align colon-delimited hash members
(defun align-to-colon (begin end)
  "Align region to char after colon"
  (interactive "r")
  (align-regexp begin end
                (rx ":" (group (zero-or-more (syntax whitespace))) ) 1 1 ))