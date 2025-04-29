; emacs 30
(setq imenu-flatten 'prefix)
(setq minibuffer-visible-completions t)
(setq project-file-history-behavior 'relativize)
(setq project-mode-line t)
(setq project-mode-line-face 'dired-directory)
(setq register-use-preview t)

(setq Man-notify-method 'pushy)
(setq async-shell-command-display-buffer nil)
(setq avy-keys '(?t ?n ?s ?e ?r ?i ?a ?o ?f ?u ?d ?h ?l ?p ?g ?m ?c))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq bookmark-save-flag 1)              ;save after any modification
(setq clean-buffer-list-delay-general 1) ;midnight-mode days
(setq column-number-mode t)
(setq completion-auto-help t)
(setq completion-ignore-case t)
(setq completion-show-help nil)
(setq completion-styles '(orderless basic))
(setq completion-category-overrides '((file (styles basic partial-completion))))
(setq completions-detailed t)
(setq completions-format 'one-column)
(setq completions-header-format "")
(setq completions-max-height nil)
(setq confirm-nonexistent-file-or-buffer nil)
(setq copy-region-blink-delay 0)        ;no blink on copy
(setq custom-file "~/.emacs.d/custom.el") ;stop customize from polluting init.el
(setq dabbrev-case-replace t)
(setq dabbrev-check-other-buffers nil)
(setq delete-old-versions t)
(setq delete-pair-blink-delay 0)
(setq dired-dwim-target t)
(setq dired-guess-shell-alist-user '(("\\." "xdg-open")))
(setq dired-listing-switches "-Alh")
(setq dired-switches-in-mode-line 'as-is)
(setq enable-recursive-minibuffers t)
(setq epg-pinentry-mode 'loopback)
(setq eshell-banner-message "")
(setq eww-auto-rename-buffer 'title)
(setq frame-resize-pixelwise t)
(setq gnus-inhibit-mime-unbuttonizing t) ;show attachment buttons for all mime parts, including inline images
(setq help-window-select t)
(setq icomplete-prospects-height 1)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-create-new-buffer 'always)
(setq ido-default-buffer-method 'selected-window)
(setq ido-default-file-method 'selected-window)
(setq ido-max-prospects 3)
(setq ido-max-window-height 1)
(setq ido-use-virtual-buffers t)
(setq inhibit-startup-echo-area-message "ric")
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq message-sendmail-extra-arguments '("--read-envelope-from")) ;get cfg from sender
(setq message-sendmail-f-is-evil t)         ;do not add username to cmdline
(setq minibuffer-default-prompt-format " [%s]")
(setq mouse-yank-at-point t)
(setq native-comp-async-report-warnings-errors 'silent) ;log warnings but not pop up the *Warnings* buffer
(setq next-error-message-highlight t)
(setq project-switch-commands 'project-dired)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq recenter-positions '(top middle bottom))
(setq resize-mini-windows t)
(setq save-interprogram-paste-before-kill t)
(setq scroll-conservatively 101)      ;do not center point, less jumpy
(setq scroll-preserve-screen-position t) ;do not lose point
(setq select-enable-primary t)    ;yank from primary set in other apps
(setq send-mail-function #'smtpmail-send-it) ;no query
(setq sendmail-program "/usr/bin/msmtp")
(setq sentence-end-double-space nil) ;make forward/backward-sentence more useful
(setq server-client-instructions nil)
(setq show-paren-context-when-offscreen t)
(setq show-paren-when-point-in-periphery t)
(setq shr-inhibit-images t)
(setq shr-use-colors nil)
(setq shr-use-fonts nil)
(setq text-mode-hook nil)
(setq tramp-allow-unsafe-temporary-files t)
(setq use-short-answers t)
(setq vc-follow-symlinks nil)
(setq version-control t)
(setq view-read-only t)
(setq warning-minimum-level :error)
(setq webjump-use-internal-browser t)
(setq wgrep-auto-save-buffer t)

(setq-default c-basic-offset 2)
(setq-default css-indent-offset 2)
(setq-default electric-indent-mode nil)
(setq-default indent-tabs-mode nil)
(setq-default js-indent-level 2)
(setq-default nginx-indent-level 2)
(setq-default python-check-command "flake8")
(setq-default python-indent-offset 2)
(setq-default sh-basic-offset 2)
(setq-default standard-indent 2)
(setq-default tab-width 2)

(setq display-buffer-alist '(("\\*\\(Buffer list\\|Code Review\\|grep\\|http\\|Help\\|Messages\\|Password\\|vc-\\)" (display-buffer-same-window))))

(add-to-list 'load-path "~/.emacs.d/lisp")

(add-to-list 'auto-mode-alist '("\\(Env\\|Stax\\)file" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.hurl" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.ts" . js-mode))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(load-theme 'min t)
(ido-mode 'buffers)


(with-eval-after-load 'code-review
  (setq code-review-new-buffer-window-strategy #'switch-to-buffer)
  (setq code-review-lgtm-message "lgtm"))

(defun code-review-link ()
  "Use link hint to open a pull request url; scrub urldefense links."
  (interactive)
  (link-hint-copy-link)
  (let ((str (current-kill 0)))
    (when (string-match "^https://urldefense.com" str)
      (setq str (nth 1 (split-string str "__"))))
    (code-review-start str)))

(defun ido-switch-project ()
  "Switch project using ido."
  (interactive)
  (project-switch-project (ido-completing-read "Project: " (project-known-project-roots))))

(defun split-window-toggle ()
  "Split window if there is just one, else delete other windows."
  (interactive)
  (if (= (count-windows) 1)
      (progn (split-window-right) (other-window 1))
    (delete-other-windows)))

(with-eval-after-load 'dired
  (add-to-list 'dired-font-lock-keywords (list dired-re-exe '(".+" (dired-move-to-filename) nil (0 'success))) 'append) ;face for exec files
  (keymap-set dired-mode-map "C-t" nil)
  (keymap-set dired-mode-map "e" #'wdired-change-to-wdired-mode)
  (keymap-set dired-mode-map "f" #'find-name-dired))

(with-eval-after-load 'elfeed
  ;; (elfeed-load-opml "~/doc/elfeed.opml")
  (load "~/doc/elfeed.el")
  (setq elfeed-search-filter "@2-weeks-ago +unread")
  (define-key elfeed-search-mode-map "d" #'elfeed-search-untag-all-unread)
  (define-key elfeed-show-mode-map "d" #'elfeed-kill-buffer)
  (define-key elfeed-show-mode-map "r" #'elfeed-kill-buffer))

(with-eval-after-load 'eww
  (keymap-set eww-mode-map "i" #'eww-toggle-images))

(with-eval-after-load 'forge
  (setq forge-post-mode-hook '(visual-line-mode))
  (keymap-set forge-topic-mode-map "r" #'forge-topic-set-review-requests)
  (keymap-set forge-topic-mode-map "w" #'forge-browse-topic))

(with-eval-after-load 'gcalcli-mode
  ;; (setq gcalcli-bin "~/.local/bin/gcalcli")
  (setq gcalcli-config-alist
        '((home . "~/.config/gcalcli/home")
          (work . "~/.config/gcalcli/work"))))

(with-eval-after-load 'github-review
  (keymap-set github-review-mode-map "C-c A" #'github-review-approve)
  (keymap-set github-review-mode-map "C-c C" #'github-review-comment)
  (keymap-set github-review-mode-map "C-c R" #'github-review-reject))

(with-eval-after-load 'go-mode
  (add-hook 'go-mode-hook #'subword-mode))

(with-eval-after-load 'grep
  (keymap-set grep-mode-map "e" #'wgrep-change-to-wgrep-mode)
  (keymap-set grep-mode-map "r" #'rgrep))

(with-eval-after-load 'ido
  (keymap-set ido-buffer-completion-map "C-t" #'ido-fallback-command)
  (keymap-set ido-file-completion-map "C-<backspace>" #'ido-delete-backward-word-updir))

(with-eval-after-load 'isearch
  (setq isearch-lax-whitespace t)        ;space matches any non-word
  (setq search-whitespace-regexp ".*?")) ;very loose matching

(with-eval-after-load 'magit
  (setq magit-status-show-untracked-files "all")
  (setq magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1))

(with-eval-after-load 'markdown
  (add-hook 'markdown-mode-hook #'visual-line-mode))

(with-eval-after-load 'message
  (setq message-dont-reply-to-names (list user-mail-address "\\@noreply\\.")))

(autoload 'mu4e "mu4e" nil t)
(with-eval-after-load 'mu4e
  (load "init-mu4e"))

(with-eval-after-load 'nov
  (setq nov-unzip-program (executable-find "unzip")))

(with-eval-after-load 'org
  (setq org-directory "~/doc")
  (setq org-log-done 'time)
  (setq org-default-priority 67)        ;C
  (setq org-hide-emphasis-markers nil)
  (setq org-display-remote-inline-images 'download)
  (setq org-support-shift-select nil)
  (setq org-src-window-setup 'current-window)
  (setq org-startup-folded 'content)
  (setq org-table-header-line t)
  (setq org-todo-interpretation 'sequence)
  (setq org-todo-keyword-faces '(("BLOCK" . link) ("REVIEW" . warning) ("WIP" . success)))
  (setq org-todo-keywords '("TODO" "BLOCK(b@/!)" "REVIEW(r@/!)" "WIP(w!)" "|" "DONE(d!)" "CANCELLED(c@)"))
  (add-hook 'org-mode-hook #'visual-line-mode)
  (keymap-set org-mode-map "C-," nil))

(with-eval-after-load 'org-agenda
  (setq org-agenda-custom-commands
        '(("h" "Home" ((agenda "") (alltodo "")) ((org-agenda-files '("home.org"))))
          ("w" "Work" ((agenda "")) ((org-agenda-files '("work.org"))))))
  (setq org-agenda-files '("work.org" "home.org" "~/doc/ical"))
  (setq org-agenda-include-diary t)
  (setq org-agenda-window-setup 'current-window)
  (add-hook 'org-agenda-mode-hook #'hl-line-mode)
  (add-hook 'org-agenda-after-show-hook #'org-narrow-to-subtree))

(with-eval-after-load 'org-capture
  (setq org-capture-templates
        '(("t" "Todo"  entry (file+olp+datetree "work.org") "* TODO %?\n%i")
          ("m" "Mtg"   entry (file+olp+datetree "work.org") "* MTG %i%?")
          ("h" "Home"  entry (file+olp+datetree "home.org") "* TODO %?")
          ("s" "Music" entry (file+olp+datetree "music.org") "* TODO %?"))))

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("paper" "\\documentclass{paper}"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))

(with-eval-after-load 'password-store
  (defun password-store--completing-read (&optional require-match)
    "Read pass entry using ido."
    (ido-completing-read "Pass: " (password-store-list) nil require-match)))

(with-eval-after-load 'selected
  (add-to-list 'selected-ignore-modes 'magit-status-mode)
  (add-to-list 'selected-ignore-modes 'magit-refs-mode)
  (keymap-set selected-keymap "'" #'insert-pair)
  (keymap-set selected-keymap "`" #'insert-pair)
  (keymap-set selected-keymap "\"" #'insert-pair)
  (keymap-set selected-keymap "(" #'insert-pair)
  (keymap-set selected-keymap "[" #'insert-pair)
  (keymap-set selected-keymap "{" #'insert-pair)
  (keymap-set selected-keymap ";" #'comment-region)
  ;; (keymap-set selected-keymap "c" #'capitalize-region)
  ;; (keymap-set selected-keymap "f" #'forward-sexp)
  ;; (keymap-set selected-keymap "l" #'downcase-region)
  (keymap-set selected-keymap "d" #'down-list)
  (keymap-set selected-keymap "m" #'mark-word)
  (keymap-set selected-keymap "s" #'mark-sexp)
  (keymap-set selected-keymap "u" #'backward-up-list)
  (keymap-set selected-keymap "w" #'copy-region-as-kill)
  (keymap-set selected-keymap "x" #'exchange-point-and-mark))

(with-eval-after-load 'terraform-mode
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))

(with-eval-after-load 'vterm
  (setq vterm-buffer-name-string "*vterm %s*") ;include shell title in buffer name
  (setq vterm-copy-mode-remove-fake-newlines t)
  (setq vterm-shell "screen")
  (keymap-set vterm-mode-map "C-j" nil)
  (keymap-set vterm-mode-map "C-t" nil)
  (keymap-set vterm-mode-map "C-c t" #'vterm)
  (keymap-set vterm-mode-map "C-<return>" #'vterm-copy-mode)
  (keymap-set vterm-copy-mode-map "C-<return>" #'vterm-copy-mode))


(add-hook 'window-setup-hook #'url-handler-mode)
(add-hook 'emacs-startup-hook #'minibuffer-depth-indicate-mode)
(add-hook 'emacs-startup-hook #'selected-global-mode)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(run-with-idle-timer 5 nil #'global-anzu-mode)
(run-with-idle-timer 5 nil #'winner-mode)
(run-with-idle-timer 10 nil #'pixel-scroll-mode)
(run-with-idle-timer 60 nil #'midnight-mode)

(defun translate-gui-keys ()
  "Translate some keys that can be differentiated in gui frames."
  (when (display-graphic-p)
    (keyboard-translate ?\C-m ?\H-m)
    (keymap-global-set "H-m" #'mark-word)))
    ;; (keymap-global-set "H-m" #'mark-sexp-at-point)))

(add-hook 'server-after-make-frame-hook #'translate-gui-keys) ;server initial frame
(add-hook 'after-init-hook #'translate-gui-keys)              ;non-server

(keymap-global-set "<remap> <dabbrev-expand>" #'hippie-expand)
(keymap-global-set "<remap> <execute-extended-command>" #'smex)

(keymap-global-set "<home>" #'beginning-of-buffer)
(keymap-global-set "<end>" #'end-of-buffer)

(keymap-global-set "C-," #'previous-buffer)
(keymap-global-set "C-." #'next-buffer)
(keymap-global-set "C-;" #'comment-line)
(keymap-global-set "C-=" #'quick-calc)
;; (keymap-global-set "C-\\" #'mark-line)
(keymap-global-set "C-\\" #'forward-to-word)
(keymap-global-set "M-\\" #'backward-to-word)
(keymap-global-set "C-'" #'forward-to-word)
(keymap-global-set "C-j" #'project-find-file)
(keymap-global-set "C-t" #'switch-to-buffer)
(keymap-global-set "C-z" #'zap-up-to-char)

;; (keymap-global-set "C-c \"" #'insert-pair)
;; (keymap-global-set "C-c '" #'insert-pair)
;; (keymap-global-set "C-c (" #'insert-pair)
;; (keymap-global-set "C-c {" #'insert-pair)
;; (keymap-global-set "C-c [" #'insert-pair)
(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c b" #'project-switch-to-buffer)
(keymap-global-set "C-c c" #'org-capture)
(keymap-global-set "C-c d" #'project-find-dir)
(keymap-global-set "C-c D" #'duplicate-dwim)
;; (keymap-global-set "C-c f" #'avy-goto-char-in-line)
(keymap-global-set "C-c f" #'project-find-file)
(keymap-global-set "C-c g" #'magit-file-dispatch)
(keymap-global-set "C-c i" #'imenu)
(keymap-global-set "C-c j" #'avy-goto-char)
(keymap-global-set "C-c k" #'kill-whole-line)
(keymap-global-set "C-c L" #'link-hint-copy-link)
(keymap-global-set "C-c l" #'link-hint-open-link)
(keymap-global-set "C-c m" #'smex)
(keymap-global-set "C-c M" #'smex-major-mode-commands)

(keymap-global-set "C-c p" #'ido-switch-project)
(keymap-global-set "C-c R" #'code-review-link)
(keymap-global-set "C-c r" #'rgrep)
(keymap-global-set "C-c s" #'magit-branch-checkout)
(keymap-global-set "C-c t" #'vterm)
(keymap-global-set "C-c u" #'winner-undo)
(keymap-global-set "C-c o" #'org-agenda)
(keymap-global-set "C-c y" #'browse-kill-ring)

(keymap-global-set "C-h C-," #'split-window-toggle)
(keymap-global-set "C-h j" #'webjump)

(keymap-global-set "s-<up>" #'enlarge-window)
(keymap-global-set "s-<down>" #'shrink-window)
(keymap-global-set "s-<right>" #'enlarge-window-horizontally)
(keymap-global-set "s-<left>" #'shrink-window-horizontally)
(keymap-global-set "s-o" #'other-window)
(keymap-global-set "s-\\" #'delete-other-windows)
(keymap-global-set "C-<tab>" #'completion-at-point)

(keymap-global-set "M-<up>" #'scroll-up-line)
(keymap-global-set "M-<down>" #'scroll-down-line)

(keymap-set ctl-x-map "g" #'magit-status)
(keymap-set ctl-x-map "j" #'dired-jump)
(keymap-set ctl-x-map "k" #'kill-current-buffer)
(keymap-set ctl-x-map "m" #'mu4e)
;; (keymap-set ctl-x-map "M" #'smex-major-mode-commands)

(keymap-set ctl-x-r-map "a" #'append-to-register)
(keymap-set ctl-x-r-map "p" #'prepend-to-register)

(keymap-global-set "<remap> <capitalize-word>" #'capitalize-dwim)
(keymap-global-set "<remap> <downcase-word>" #'downcase-dwim)
(keymap-global-set "<remap> <upcase-word>" #'upcase-dwim)
(keymap-global-set "<remap> <compose-mail>" #'mu4e)
(keymap-global-set "<remap> <kill-buffer>" #'kill-current-buffer)
