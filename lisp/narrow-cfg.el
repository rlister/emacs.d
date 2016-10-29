;; narrowing buffer
;; c-x n n     Narrow down to between point and mark (narrow-to-region).
;; C-x n w     Widen to make the entire buffer accessible again (widen).
;; C-x n p     Narrow down to the current page (narrow-to-page).
;; C-x n d     Narrow down to the current defun (narrow-to-defun).
(put 'narrow-to-region 'disabled nil) ;do not disable it, I'm not a newb