;; fix modifier keys in macOS
(when (equal window-system 'ns)
  (set-face-font 'default "Roboto Mono-11:foundry=GOOG")
  (setq default-directory "~/")
  (blink-cursor-mode -1)
  (menu-bar-mode -1)
  (setq ns-auto-hide-menu-bar nil)
  (setq ns-command-modifier 'control)
  (setq ns-right-command-modifier 'control)
  (setq ns-option-modifier 'meta)
  (setq ns-control-modifier 'control)
  (setq ns-function-modifier 'hyper)
  (when (display-graphic-p)
    (tool-bar-mode -1)
    (customize-set-variable 'scroll-bar-mode nil)
    (customize-set-variable 'horizontal-scroll-bar-mode nil)
    (setq default-frame-alist '((undecorated . t)))))

;; On macOS we need to download and compile emacs-vterm manually.
;; brew install cmake libtool
;; git clone https://github.com/akermu/emacs-libvterm.git
;; cd emacs-libvterm/build
;; cmake .. && make

;; Add compiled file location to =load-path=.

(when (equal system-type 'darwin)
  (add-to-list 'load-path "~/src/emacs-libvterm"))
