(defun pretty-function ()
  "Overlay function keyword with ƒ."
  (interactive)
  (font-lock-add-keywords nil `(("\\<function\\>"
                                 (0 (progn (compose-region (match-beginning 0) (match-end 0) "ƒ")
                                           nil))))))
(defun pretty-lambda ()
  "Overlay lambda keyword with λ."
  (interactive)
  (font-lock-add-keywords nil `(("\\<lambda\\>"
                                 (0 (progn (compose-region (match-beginning 0) (match-end 0) "λ")
                                           nil))))))
