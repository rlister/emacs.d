;; by default, resizes by 8 columns and by 4 rows. Customize by
;; setting windsize-cols and/or windsize-rows.
(use-package windsize
  :ensure t
  :bind (
         ("M-<left>"  . windsize-left)
         ("M-<right>" . windsize-right)
         ("M-<up>"    . windsize-up)
         ("M-<down>"  . windsize-down)
         )
  )