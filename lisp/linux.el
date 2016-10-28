(setq x11 (cond ((equal window-system 'x) t)))

(when x11
  (set-face-attribute 'default nil :family "Inconsolata" :height 120 :weight 'normal :width 'normal)
  )

;; (when (eq system-type 'gnu/linux)
;;   )