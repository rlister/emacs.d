(use-package frame
  :bind
  ("<M-return>" . toggle-frame-fullscreen)
  ("<s-return>" . toggle-frame-fullscreen)
  :config
  (blink-cursor-mode -1)             ;or I will kill you
  )