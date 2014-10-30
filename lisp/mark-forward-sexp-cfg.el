;; https://github.com/rlister/mark-forward-sexp
(autoload 'mark-inside-forward-sexp "mark-forward-sexp" nil t)

(global-set-key (kbd "C-c o") 'mark-forward-sexp)
(global-set-key (kbd "C-c O") 'mark-backward-sexp)
(global-set-key (kbd "C-c i") 'mark-inside-forward-sexp)
(global-set-key (kbd "C-c I") 'mark-inside-backward-sexp)
