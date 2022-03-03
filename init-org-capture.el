(setq org-capture-bookmark nil)

(setq org-capture-templates
      '(("t" "Todo" entry (file+olp+datetree "~/src/doc/work.org")
         "* TODO %?" :empty-lines 0 :tree-type week)
        ("d" "Done" entry (file+olp+datetree "~/src/doc/work.org")
         "* DONE %?\n- State \"DONE\" %U" :empty-lines 0 :tree-type week)
        ("m" "Meeting" entry (file+olp+datetree "~/src/doc/work.org")
         "* MTG %?" :empty-lines 0 :tree-type week)
        ("h" "Home" entry (file+olp+datetree "~/src/doc/home.org")
         "* TODO %?" :empty-lines 0 :tree-type week)
        ("j" "Journal" entry (file+olp+datetree "~/src/doc/work.org")
         "* %<%H:%M> %?" :empty-lines 0 :tree-type week)))
