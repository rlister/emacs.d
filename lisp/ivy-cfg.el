(use-package ivy
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  (setq magit-completing-read-function 'ivy-completing-read)
  ;; (ivy-set-display-transformer
  ;;  'ivy-switch-buffer 'ric/ivy-switch-buffer-transformer)

;; (defalias 'ric/ivy--term-p
;;   (lambda (name)
;;     "Return non-nil if buffer NAME looks like a term."
;;     (string-match-p "\\`term -" name)))

;; (defalias 'ric/ivy--ruby-p
;;   (lambda (name)
;;     "Return non-nil if buffer NAME looks like a ruby file."
;;     (string-match-p "\\.rb\\b" name)))

;; (defalias 'ric/ivy--js-p
;;   (lambda (name)
;;     "Return non-nil if buffer NAME looks like a javascript file."
;;     (string-match-p "\\.js\\b" name)))

;; (defalias 'ric/ivy--elisp-p
;;   (lambda (name)
;;     "Return non-nil if buffer NAME looks like an emacs lisp file."
;;     (string-match-p "\\.el\\b" name)))

;; (defun ric/ivy-switch-buffer-transformer (str)
;;   "Transform candidate STR when switching buffer."
;;   (cond
;;    ((ric/ivy--term-p str)  (propertize str 'face 'term-color-green))
;;    ((ric/ivy--ruby-p str)  (propertize str 'face 'term-color-red))
;;    ((ric/ivy--js-p str)    (propertize str 'face 'term-color-yellow))
;;    ((ric/ivy--elisp-p str) (propertize str 'face 'term-color-magenta))
;;    (t str)
;;    ))