;; MacTeX installation
(when ric-darwin-p
  (add-to-list 'exec-path "/Library/TeX/texbin"))

(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))