(add-to-list 'load-path "~/src/emacs.d")

;; inhibit minibuffer messages for new emacs frame or new emacslient frame
(setq inhibit-startup-echo-area-message "ric")
(setq server-client-instructions nil)
(setq eww-auto-rename-buffer 'title)
(setq use-short-answers t)

;; allow disabled commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq version-control t)
(setq delete-old-versions t)
(setq bookmark-save-flag 1)             ;save after any modification

(setq transient-mark-mode nil)    ;do not highlight region
(setq select-active-regions nil)  ;do not send all regions to primary
(setq select-enable-primary t)    ;yank from primary set in other apps

(setq display-buffer-alist
      '(("\\*Help\\*" (display-buffer-same-window))
        ("\\*Code Review\\*" (display-buffer-same-window))
        ("\\*docker-" (display-buffer-same-window))
        ("\\*Occur\\*" (display-buffer-same-window))
        ("\\*rg\\*" (display-buffer-same-window))
        ("\\*Packages\\*" (display-buffer-same-window))))

(setq sentence-end-double-space nil) ;make forward/backward-sentence more useful

(setq epg-pinentry-mode 'loopback) ;pinentry queries in minibuffer

(setq scroll-preserve-screen-position t) ;do not lose point
(setq scroll-conservatively 101)         ;do not center point, less jumpy

;; (with-eval-after-load 'vertico
;;   (setq completion-styles '(orderless))
;;   ;; (marginalia-mode +1)
;;   (define-key vertico-map [remap switch-to-buffer] #'vertico-exit))

;; (with-eval-after-load 'corfu
;;   (setq corfu-quit-no-match nil)
;;   (setq corfu-on-exact-match nil)
;;   (define-key corfu-map (kbd "SPC") #'corfu-insert-separator))

;; (with-eval-after-load 'orderless
;;   (setq completion-category-defaults nil)) ;prevent overrides of styles

(with-eval-after-load 'minibuffer
  (setq completion-show-help nil)
  (setq completions-format 'one-column)
  (setq completion-styles '(partial-completion flex)) ;(substring flex))
  (setq completion-auto-help 'always)
  (setq completion-ignore-case t)
  (setq read-file-name-completion-ignore-case t)
  (setq read-buffer-completion-ignore-case t)
  (define-key minibuffer-local-must-match-map (kbd "<up>") #'minibuffer-previous-completion)
  (define-key minibuffer-local-must-match-map (kbd "<down>") #'minibuffer-next-completion)
  (define-key minibuffer-local-map (kbd "C-n") #'next-history-element)
  (define-key minibuffer-local-map (kbd "C-p") #'previous-history-element))

(with-eval-after-load 'man
  (setq Man-notify-method 'pushy))

(add-to-list 'auto-mode-alist '("\\.out\\'" . view-mode))
(with-eval-after-load 'view-mode
  (setq view-read-only t)
  (define-key view-mode-map (kbd "n") #'next-line)
  (define-key view-mode-map (kbd "p") #'previous-line)
  (define-key view-mode-map (kbd "i") #'view-mode)
  (define-key view-mode-map (kbd "k") #'kill-current-buffer))

(with-eval-after-load 'prog-mode
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq-default c-basic-offset 2)
  (setq-default sh-basic-offset 2)
  (setq-default python-indent 2)
  (setq-default js-indent-level 2)
  (setq-default css-indent-offset 2)
  (setq-default python-check-command "flake8")
  (setq show-paren-context-when-offscreen t)
  (setq show-paren-when-point-in-periphery t)
  (show-paren-mode 1)
  ;; (global-tree-sitter-mode 1))
  (electric-pair-mode))

(add-to-list 'auto-mode-alist '("Envfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Staxfile" . ruby-mode))

(with-eval-after-load 'go-mode
  ;; (add-hook 'go-mode-hook #'tree-sitter-hl-mode)
  (add-hook 'go-mode-hook #'eglot-ensure)
  (add-hook 'go-mode-hook #'subword-mode))

(with-eval-after-load 'eglot
  ;; (global-corfu-mode 1)
  (define-key eglot-mode-map (kbd "C-c C-r") #'eglot-rename))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c C-p") #'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "C-c C-n") #'flymake-goto-next-error))

;; less garish html rendering
(with-eval-after-load 'shr
  (setq shr-use-fonts nil)
  (setq shr-use-colors nil))

(with-eval-after-load 'cus-edit
  (setq custom-file "~/.emacs.d/custom.el")) ;stop customize from polluting init.el

(with-eval-after-load 'dired
  (setq dired-guess-shell-alist-user '(("\\." "xdg-open")))
  (setq dired-listing-switches "-alh")
  (add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode) ;attach files from dired to mu4e
  (add-to-list 'dired-font-lock-keywords (list dired-re-exe '(".+" (dired-move-to-filename) nil (0 'success))) 'append) ;face for exec files
  (define-key dired-mode-map (kbd "f") #'find-name-dired)
  (define-key dired-mode-map (kbd "_") (lambda () (interactive) (dired-do-rename-regexp "^.*$" "_\\&"))) ;prepend underscore
  (define-key dired-mode-map (kbd "C-c _") (lambda () (interactive) (dired-do-rename-regexp "^_" ""))))  ;remove leading underscore

(with-eval-after-load 'isearch
  (setq isearch-lax-whitespace t)       ;space matches any non-word
  (setq search-whitespace-regexp ".*?") ;very loose matching
  (define-key isearch-mode-map (kbd "C-<return>") 'ric-isearch-exit-other-end)
  (define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char) ;backspace should edit search string
  (global-anzu-mode +1))

(with-eval-after-load 'project
  (setq-default xref-search-program 'ugrep)
  (setq project-switch-commands
        '((project-switch-to-buffer "buffer" ?b)
          (project-dired "dir" ?d)
          (project-find-file "file" ?f)
          (project-find-regexp "grep" ?g)
          (magit-project-status "magit" ?m)
          (rg-project "rg" ?r)
          (vterm "vterm" ?t)
          (vc-dir "vc" ?v))))

(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (defun package-make-button (text &rest properties)
    "Override hard-coded button face from package.el."
    (apply #'insert-text-button text 'face 'button 'follow-link t properties)))

;; (setq completion-auto-help 't)
;; (with-eval-after-load 'marginalia
;;   (setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil)))

(with-eval-after-load 'magit
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
  (defun forge--contrast-color (color) "black"))

(with-eval-after-load 'forge
  (define-key forge-topic-mode-map (kbd "r") #'forge-edit-topic-review-requests)
  (define-key forge-topic-mode-map (kbd "w") #'forge-browse-topic))

(with-eval-after-load 'smerge-mode
  (define-key smerge-mode-map (kbd "C-<down>") #'smerge-next)
  (define-key smerge-mode-map (kbd "C-<up>") #'smerge-prev))

(with-eval-after-load 'avy
  (setq avy-keys '(?t ?n ?s ?e ?r ?i ?a ?o ?f ?u ?d ?h ?l ?p ?g ?m ?c))) ;colemak-friendly keys

(with-eval-after-load 'org
  (load "init-org"))

(with-eval-after-load 'org-agenda
  (load "init-org-agenda")
  (define-key org-agenda-mode-map (kbd "<C-down>") #'org-agenda-next-date-line)
  (define-key org-agenda-mode-map (kbd "<C-up>") #'org-agenda-previous-date-line))

(with-eval-after-load 'org-capture
  (load "init-org-capture"))

(with-eval-after-load 'eshell
  (setq eshell-banner-message ""))

(with-eval-after-load 'vterm
  (load "init-vterm"))

(advice-add 'mark-sexp :filter-args #'ric-mark-args)

(with-eval-after-load 'elfeed
  (elfeed-load-opml "~/src/doc/elfeed.opml")
  (setq elfeed-search-filter "@2-weeks-ago +unread")
  (define-key elfeed-search-mode-map "d" #'elfeed-search-untag-all-unread)
  (define-key elfeed-show-mode-map "d" #'elfeed-kill-buffer)
  (define-key elfeed-show-mode-map "r" #'elfeed-kill-buffer))

(with-eval-after-load 'alert
  (setq alert-default-style 'libnotify))

(with-eval-after-load 'gcalcli-mode
  (setq gcalcli-bin "~/.local/bin/gcalcli")
  (setq gcalcli-config-alist
        '((home . "~/.config/gcalcli/home")
          (work . "~/.config/gcalcli/work"))))

(with-eval-after-load 'markdown-mode
  (add-hook 'markdown-mode-hook #'visual-line-mode)
  (define-key markdown-mode-map (kbd "C-c v") #'markdown-view-mode)
  (define-key markdown-view-mode-map (kbd "C-c v") #'markdown-mode))

(with-eval-after-load 'slack
  (load "init-slack"))

(with-eval-after-load 'code-review
  (setq code-review-new-buffer-window-strategy #'switch-to-buffer))

(with-eval-after-load 'pabbrev
  (load "init-pabbrev"))

(autoload 'mu4e "mu4e" nil t)
(with-eval-after-load 'mu4e
  (load "init-mu4e"))

(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(advice-add 'mark-sexp :filter-args #'ric-mark-args)

(autoload 'min-theme "min-theme" nil t)
(autoload 'ric-keys-mode "ric-keys-mode" nil t)
;; (autoload 'font-height-increase "font-height" nil t)
;; (autoload 'no-mouse-mode "no-mouse-mode" nil t)

;; hooks
(add-hook 'after-init-hook #'min-theme)
;; (add-hook 'after-init-hook #'vertico-mode)
(add-hook 'window-setup-hook #'ric-keys-mode)
(add-hook 'window-setup-hook #'winner-mode)
(add-hook 'server-after-make-frame-hook #'ric-key-translations)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; delayed loads
(run-with-idle-timer 5 nil #'global-visible-mark-mode)
(run-with-idle-timer 5 nil #'global-pabbrev-mode)
(run-with-idle-timer 10 nil #'pixel-scroll-mode)
(run-with-idle-timer 60 nil #'midnight-mode)
