(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq bookmark-save-flag 1)              ;save after any modification
(setq clean-buffer-list-delay-general 1) ;midnight-mode days
;; (setq completion-auto-help t)
(setq completion-ignore-case t)
(setq completion-show-help nil)
;; (setq completion-styles '(initials partial-completion substring flex))
;; (setq completion-styles ';; (basic partial-completion emacs22))
;; (setq completion-category-overrides '((project-file (styles substring flex))))
;; (setq completion-category-overrides nil)
(setq completions-detailed t)
(setq completions-format 'one-column)
(setq completion-auto-help 'always)
(setq completion-auto-select 'second-tab)
(setq custom-file "~/.emacs.d/custom.el") ;stop customize from polluting init.el
(setq delete-old-versions t)
(setq epg-pinentry-mode 'loopback)     ;pinentry queries in minibuffer
(setq eshell-banner-message "")
(setq enable-recursive-minibuffers t)
(setq eww-auto-rename-buffer 'title)
(setq gnus-inhibit-mime-unbuttonizing t) ;show attachment buttons for all mime parts, including inline images
(setq icomplete-prospects-height 1) ;minibuffer height
(setq icomplete-separator "  ")
(setq inhibit-startup-echo-area-message "ric")
(setq Man-notify-method 'pushy)
(setq message-sendmail-f-is-evil t)         ;do not add username to cmdline
(setq message-sendmail-extra-arguments '("--read-envelope-from")) ;get cfg from sender
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq minibuffer-default-prompt-format "")
(setq native-comp-async-report-warnings-errors 'silent) ;log warnings but not pop up the *Warnings* buffer
(setq next-error-message-highlight t)
(setq pabbrev-idle-timer-verbose t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq resize-mini-windows nil)
(setq scroll-conservatively 101)      ;do not center point, less jumpy
(setq scroll-preserve-screen-position t) ;do not lose point
(setq select-active-regions nil)  ;do not send all regions to primary
(setq select-enable-primary t)    ;yank from primary set in other apps
(setq send-mail-function #'smtpmail-send-it) ;no query
(setq sendmail-program "/usr/bin/msmtp")
(setq sentence-end-double-space nil) ;make forward/backward-sentence more useful
(setq server-client-instructions nil)
(setq show-paren-context-when-offscreen t)
(setq show-paren-when-point-in-periphery t)
(setq shr-inhibit-images t)
(setq shr-use-fonts nil)
(setq shr-use-colors nil)
(setq transient-mark-mode nil)
(setq use-short-answers t)
(setq vc-follow-symlinks nil)
(setq version-control t)
(setq view-read-only t)

(setq-default indent-tabs-mode nil)
(setq-default standard-indent 2)
(setq-default c-basic-offset 2)
(setq-default css-indent-offset 2)
(setq-default js-indent-level 2)
(setq-default python-check-command "flake8")
(setq-default python-indent-offset 2)
(setq-default sh-basic-offset 2)
(setq-default tab-width 2)
(setq-default nginx-indent-level 2)

(setq display-buffer-alist
      '(("\\*Help\\*" (display-buffer-same-window))
        ("\\*Shortdoc" (display-buffer-same-window))
        ("\\*Code Review\\*" (display-buffer-same-window))
        ("\\*Occur\\*" (display-buffer-same-window))
        ("\\*rg\\*" (display-buffer-same-window))
        ("\\*Packages\\*" (display-buffer-same-window))))

(add-to-list 'load-path "~/src/emacs.d")
(add-to-list 'auto-mode-alist '("Envfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Staxfile" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.out\\'" . view-mode))

(put 'narrow-to-region 'disabled nil)

(with-eval-after-load 'go-mode
  ;; (add-hook 'go-mode-hook #'tree-sitter-hl-mode)
  (add-hook 'go-mode-hook #'eglot-ensure)
  (add-hook 'go-mode-hook #'subword-mode))

(with-eval-after-load 'terraform-mode
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c C-r") #'eglot-rename))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c C-p") #'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "C-c C-n") #'flymake-goto-next-error))

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
  (global-anzu-mode 1))

(with-eval-after-load 'project
  (defun ric-project-vterm ()
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (vterm)))
  (setq project-switch-commands
        '((project-switch-to-buffer "buffer" ?b)
          (project-dired "dir" ?d)
          (project-find-file "file" ?f)
          (project-kill-buffers "kill" ?k)
          (magit-project-status "magit" ?m)
          (rg-project "rg" ?r)
          (ric-project-vterm "vterm" ?t)
          (vc-dir "vc" ?v))))

(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))

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

(with-eval-after-load 'pabbrev
  (put 'org-mode 'pabbrev-global-mode-excluded-modes t) ;org-mode has post-command-hook bug with pabbrev
  (define-key pabbrev-mode-map [tab] 'pabbrev-expand-maybe)) ;https://lists.gnu.org/archive/html/emacs-orgmode/2016-02/msg00311.html

(with-eval-after-load 'org
  (define-key pabbrev-mode-map [tab] 'pabbrev-expand-maybe) ;https://lists.gnu.org/archive/html/emacs-orgmode/2016-02/msg00311.html
  (setq org-directory "~/src/doc")
  (setq org-log-done 'time)
  (setq org-src-window-setup 'current-window)
  (setq org-todo-interpretation 'sequence)
  (setq org-todo-keyword-faces '(("BLOCK" . link) ("REVIEW" . warning) ("WIP" . success)))
  (setq org-todo-keywords '("TODO" "BLOCK(b@/!)" "REVIEW(r@/!)" "WIP(w!)" "|" "DONE(d!)" "CANCELLED(c@)")))

(with-eval-after-load 'org-agenda
  (defun org-agenda-set-mode-name ()
    (setq mode-name (list "Org-Agenda")))
  (setq org-agenda-window-setup 'current-window)
  (setq org-agenda-custom-commands
        '(("b" "Backlog" alltodo "" ((org-agenda-files '("work.org"))))
          ("g" "Report" agenda "" ((org-agenda-files '("work.org")) (org-agenda-prefix-format "")))
          ("h" "Home" ((agenda "") (alltodo "")) ((org-agenda-files '("home.org"))))
          ("n" "Next" tags "next" ((org-agenda-files '("work.org"))))
          ("w" "Work" agenda "" ((org-agenda-files '("work.org"))))))
  (add-hook 'org-agenda-mode-hook #'hl-line-mode)
  (add-hook 'org-agenda-after-show-hook #'org-narrow-to-subtree)
  (define-key org-agenda-mode-map (kbd "<C-down>") #'org-agenda-next-date-line)
  (define-key org-agenda-mode-map (kbd "<C-up>") #'org-agenda-previous-date-line))

(with-eval-after-load 'org-capture
  (setq org-capture-templates
        '(("t" "Todo"  entry (file+olp+datetree "work.org") "* TODO %?\n%i")
          ("m" "Mtg"   entry (file+olp+datetree "work.org") "* MTG %?")
          ("h" "Home"  entry (file+olp+datetree "home.org") "* TODO %?")
          ("s" "Music" entry (file+olp+datetree "music.org") "* TODO %?"))))

(with-eval-after-load 'vterm
  (setq vterm-buffer-name-string "*vterm %s*") ;include shell title in buffer namen
  (setq vterm-keymap-exceptions '("C-," "C-." "C-t" "C-c" "C-x" "C-u" "C-g" "C-h" "C-l" "M-x" "M-o" "C-v" "M-v" "C-y" "M-y"))
  (setq vterm-shell "screen")
  (define-key vterm-mode-map (kbd "<C-backspace>") #'vterm-send-meta-backspace)
  (define-key vterm-mode-map (kbd "C-z") #'vterm--self-insert)
  ;; (define-key vterm-mode-map (kbd "C-c C-c") #'vterm--self-insert)
  (define-key vterm-mode-map (kbd "<C-return>") #'vterm-copy-mode)
  (define-key vterm-copy-mode-map (kbd "<C-return>") #'vterm-copy-mode))

(with-eval-after-load 'elfeed
  (elfeed-load-opml "~/src/doc/elfeed.opml")
  (setq elfeed-search-filter "@2-weeks-ago +unread")
  (define-key elfeed-search-mode-map "d" #'elfeed-search-untag-all-unread)
  (define-key elfeed-show-mode-map "d" #'elfeed-kill-buffer)
  (define-key elfeed-show-mode-map "r" #'elfeed-kill-buffer))

(with-eval-after-load 'gcalcli-mode
  (setq gcalcli-bin "~/.local/bin/gcalcli")
  (setq gcalcli-config-alist
        '((home . "~/.config/gcalcli/home")
          (work . "~/.config/gcalcli/work"))))

(with-eval-after-load 'markdown-mode
  (add-hook 'markdown-mode-hook #'visual-line-mode)
  (define-key markdown-mode-map (kbd "C-c v") #'markdown-view-mode)
  (define-key markdown-view-mode-map (kbd "C-c v") #'markdown-mode))

(autoload 'mu4e "mu4e" nil t)
(with-eval-after-load 'mu4e
  (load "init-mu4e"))

;; (advice-add 'mark-sexp :filter-args #'ric-mark-args)

(autoload 'min-theme "min-theme" nil t)
(autoload 'ric-keys-mode "ric-keys-mode" nil t)
(autoload 'ric-code-review-link-hint "ric-lib" nil t)
;; (autoload 'font-height-increase "font-height" nil t)
;; (autoload 'no-mouse-mode "no-mouse-mode" nil t)

(add-hook 'after-init-hook #'min-theme)
(add-hook 'window-setup-hook #'ric-keys-mode)
(add-hook 'window-setup-hook #'winner-mode)
(add-hook 'window-setup-hook #'fido-mode)
(add-hook 'server-after-make-frame-hook #'ric-key-translations)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(run-with-idle-timer 5 nil #'global-visible-mark-mode)
(run-with-idle-timer 5 nil #'global-pabbrev-mode)
(run-with-idle-timer 10 nil #'pixel-scroll-mode)
(run-with-idle-timer 60 nil #'midnight-mode)
(run-with-idle-timer 60 nil #'recentf-mode)
(run-with-idle-timer 60 nil #'minibuffer-depth-indicate-mode)
