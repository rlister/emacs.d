(setq org-capture-bookmark nil)

(setq org-capture-templates
      '(("t" "Todo"  entry (file+olp+datetree "work.org") "* TODO %?\n%i" :empty-lines 0 :tree-type week)
        ("m" "Mtg"   entry (file+olp+datetree "work.org") "* MTG %?" :empty-lines 0 :tree-type week)
        ("h" "Home"  entry (file+olp+datetree "home.org") "* TODO %?" :empty-lines 0 :tree-type week)
        ("s" "Music" entry (file+olp+datetree "music.org") "* MTG %?" :empty-lines 0 :tree-type week)))
