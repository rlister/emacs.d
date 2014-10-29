(require 'cl)                       ;chruby uses mapcan and needs this
(require 'chruby)                   ;from melpa
(chruby "2.0.0")

(defun irb ()
  (interactive)
  (inf-ruby))

(defun pry ()
  (interactive)
  (inf-ruby "pry"))

(defun console ()
  (interactive)
  (inf-ruby-console-auto))

(defalias 'bi 'bundle-install)          ;install bundler from melpa

(add-to-list 'auto-mode-alist '("Procfile$"   . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb$"      . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$"    . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$"  . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq enh-ruby-bounce-deep-indent t)	;gold-dust ... hit tab to toggle deep and normal indent for blocks

(eval-after-load 'ruby-mode
  '(progn
     (add-hook
      'ruby-mode-hook
      (lambda ()
        ;; (pretty-lambda)                 ;utf-8 lambda
        ;; (ruby-end-mode)                 ;from melpa
        (setq show-trailing-whitespace t)
        (whitespace-cleanup-on-save)))))

(eval-after-load 'enh-ruby-mode
  '(progn
     (add-hook
      'enh-ruby-mode-hook
      (lambda ()
        ;; (ruby-end-mode) ;; built-in to enh-ruby-mode?
        (setq show-trailing-whitespace t)
        (whitespace-cleanup-on-save)
        (inf-ruby-minor-mode)))))
