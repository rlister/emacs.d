;; reduce GC for faster startup
(setq gc-cons-threshold (* 50 1000 1000))

;; make installed packages available on start
(setq package-enable-at-startup t)
(setq package-quickstart t)

;; gui disabled in xresources, but do it for terminal mode also
(menu-bar-mode -1)
(tooltip-mode -1)                       ;display tooltips in minibuffer
(blink-cursor-mode -1)                  ;no blink in gui
(setq visible-cursor nil)               ;no blink in xterm
(setq use-dialog-box nil)               ;no dialog for mouse commands
(setq use-file-dialog nil)              ;ditto

;; remove unnecessary initial work
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
