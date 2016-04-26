;; autocomplete
;; manual: http://auto-complete.org/doc/manual.html
;; put my own completions in ~/.dict and call ac-clear-dictionary-cache to update

(ac-config-default)
(add-to-list 'ac-modes 'enh-ruby-mode 'ruby-mode)

;; use tab to complete instead of automatically
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")
;; (setq tab-always-indent 'complete)