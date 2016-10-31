;; this mode seems to load js-mode, and so inherits that js-indent-level
(use-package json-mode
  :ensure t
  :mode (
         "\\.json\\'"
         "\\.json.erb\\'"
         )
  )