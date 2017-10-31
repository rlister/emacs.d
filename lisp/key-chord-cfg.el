(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-define term-raw-map "jk" 'ric/term-toggle-line-char-mode)
  )