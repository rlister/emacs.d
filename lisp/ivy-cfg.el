(use-package ivy
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  (setq magit-completing-read-function 'ivy-completing-read)
  (ivy-set-display-transformer
   'ivy-switch-buffer 'ric/ivy-switch-buffer-transformer)
  :bind (
         ;; ("<M-return>" . ivy-switch-buffer)
         ("C-x b" . ivy-switch-buffer)
         ("C-x B" . switch-to-buffer)   ;legacy
         ))

(defalias 'ric/ivy--term-p
  (lambda (name)
    "Return non-nil if buffer NAME looks like a term."
    (string-match-p "\\`term -" name)))

(defun ric/ivy-switch-buffer-transformer (str)
  "Transform candidate STR when switching buffer."
  (if (ric/ivy--term-p str)
      (propertize str 'face 'font-lock-keyword-face)
    str))