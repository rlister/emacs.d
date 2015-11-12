(helm-mode 1)

;; make helm use sized window at bottom
(add-to-list 'display-buffer-alist
                    `(,(rx bos "*helm" (* not-newline) "*" eos)
                         (display-buffer-in-side-window)
                         (inhibit-same-window . t)
                         (window-height . 0.4)))

;; do not let golden-ratio affect helm window size
(defun helm-running-p ()
  helm-alive-p)
(setq golden-ratio-inhibit-functions '(helm-running-p))

;; turn on fuzzy-matching for various things
(setq
 helm-display-header-line nil             ;no header line about C-j
 helm-swoop-split-with-multiple-windows t ;use horizontal split even when a vert split exists
 helm-buffers-fuzzy-matching t
 helm-imenu-fuzzy-match t
 helm-M-x-fuzzy-match t
 helm-swoop-use-fuzzy-match t)

;; install helm-descbinds from melpa
(helm-descbinds-mode 1)

(global-set-key (kbd "C-x m")   'helm-M-x)  ;use this instead of M-x
(global-set-key (kbd "C-x C-m") 'helm-M-x)  ;common typo
(global-set-key (kbd "C-x b")   'helm-mini) ;replace ido-switch-buffer
(global-set-key (kbd "M-y")     'helm-show-kill-ring) ;replaces browse-kill-ring, see also evil map