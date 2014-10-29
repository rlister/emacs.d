(global-set-key (kbd "C-/") 'hl-line-mode)    ;previously 'undo
(setq hl-line-sticky-flag nil)                ;just turn on for current mode
;; (defalias 'hl ''global-hl-line-mode)

;; on-screen from melpa shows last view when scrolling
(on-screen-global-mode +1)
