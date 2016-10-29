(setq ric-x11-p (cond ((equal window-system 'x) t)))

(when ric-x11-p
  (set-face-attribute 'default nil :family "Inconsolata" :height 120 :weight 'normal :width 'normal)
  )