;; melpa swiper pkg also installs ivy and counsel
(use-package swiper
  :ensure t
  :init
  (setq ivy-format-function 'ivy-format-function-arrow)
  )