(setq Man-notify-method 'pushy)
(setq async-shell-command-display-buffer nil)
(setq avy-keys '(?t ?n ?s ?e ?r ?i ?a ?o ?f ?u ?d ?h ?l ?p ?g ?m ?c))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq bookmark-save-flag 1)              ;save after any modification
(setq clean-buffer-list-delay-general 1) ;midnight-mode days
(setq completion-auto-help 'visible)
(setq completion-ignore-case t)
(setq completion-show-help nil)
(setq completion-styles '(partial-completion substring initials flex))
(setq completions-detailed t)
(setq completions-format 'one-column)
(setq completions-header-format nil)
(setq confirm-nonexistent-file-or-buffer nil)
(setq copy-region-blink-delay 0)        ;no blink on copy
(setq custom-file "~/.emacs.d/custom.el") ;stop customize from polluting init.el
(setq custom-theme-directory "~/src/emacs.d")
(setq dabbrev-case-replace t)
(setq dabbrev-check-other-buffers nil)
(setq delete-old-versions t)
(setq delete-pair-blink-delay 0)
(setq enable-recursive-minibuffers t)
(setq epg-pinentry-mode 'loopback)
(setq eshell-banner-message "")
(setq eww-auto-rename-buffer 'title)
(setq gnus-inhibit-mime-unbuttonizing t) ;show attachment buttons for all mime parts, including inline images
(setq help-window-select t)
(setq ido-create-new-buffer 'always)
(setq ido-default-buffer-method 'selected-window)
(setq ido-default-file-method 'selected-window)
(setq ido-max-prospects 5)
(setq ido-use-virtual-buffers t)
(setq inhibit-startup-echo-area-message "ric")
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq message-sendmail-extra-arguments '("--read-envelope-from")) ;get cfg from sender
(setq message-sendmail-f-is-evil t)         ;do not add username to cmdline
(setq minibuffer-default-prompt-format "")
(setq mouse-yank-at-point t)
(setq native-comp-async-report-warnings-errors 'silent) ;log warnings but not pop up the *Warnings* buffer
(setq next-error-message-highlight t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq resize-mini-windows nil)
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

(setq display-buffer-alist '(("\\*\\(Buffer list\\|Help\\|Messages\\|Password\\|vc-\\)" (display-buffer-same-window))))

(add-to-list 'auto-mode-alist '("\\(Env\\|Stax\\)file" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ya?ml" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.hurl" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.ts" . js-mode))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defun ido-enter-bs-show ()
  "Drop into `bs-show' from buffer switching."
  (interactive)
  (setq ido-exit 'fallback)
  (setq ido-fallback 'bs-show)
  (exit-minibuffer))

(defun vterm-toggle ()
  "If a vterm exists for current dir, switch to it, else create a new vterm."
  (interactive)
  (require 'vterm)
  (let* ((dir (directory-file-name (abbreviate-file-name default-directory)))
         (name (format vterm-buffer-name-string dir)))
    (if (get-buffer name)
        (switch-to-buffer name)
      (vterm))))

(defun mark-line ()
  "Mark whole line, leaving point in current position."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position))
  (activate-mark))

(defun mark-sexp-at-point ()
  "Mark sexp at point. If no sexp at point, move forward and mark next sexp."
  (interactive)
  (or (thing-at-point 'sexp) (forward-sexp))
  (let ((bounds (bounds-of-thing-at-point 'sexp)))
    (when (null bounds) (error "No sexp at point"))
    (goto-char (car bounds))
    (push-mark nil t t)
    (goto-char (cdr bounds))))

(defun code-review-link ()
  "Use link hint to open a pull request url."
  (interactive)
  (link-hint-copy-link)
  (github-review-start (current-kill 0)))
  ;; (code-review-start (current-kill 0)))

(defun link-hint-open-eww ()
  "Use link hint to open url in eww."
  (interactive)
  (link-hint-copy-link)
  (eww (current-kill 0)))

(defun split-window-toggle ()
  "Split window if there is just one, else delete other windows."
  (interactive)
  (if (= (count-windows) 1)
      (progn (split-window-right) (other-window 1))
    (delete-other-windows)))

(with-eval-after-load 'dired
  (setq dired-guess-shell-alist-user '(("\\." "xdg-open")))
  (setq dired-listing-switches "-alh")
  (setq dired-dwim-target t)
  ;; (add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode) ;attach files from dired to mu4e
  (add-to-list 'dired-font-lock-keywords (list dired-re-exe '(".+" (dired-move-to-filename) nil (0 'success))) 'append) ;face for exec files
  (keymap-set dired-mode-map "C-<down>" #'dired-subtree-down)
  (keymap-set dired-mode-map "C-<up>" #'dired-subtree-up)
  (keymap-set dired-mode-map "C-t" nil)
  (keymap-set dired-mode-map "," #'dired-collapse-mode)
  (keymap-set dired-mode-map "e" #'wdired-change-to-wdired-mode)
  (keymap-set dired-mode-map "f" #'find-name-dired)
  (keymap-set dired-mode-map "<tab>" #'dired-subtree-cycle)
  (keymap-set dired-mode-map "_" (lambda () (interactive) (dired-do-rename-regexp "^.*$" "_\\&"))) ;prepend underscore
  (keymap-set dired-mode-map "C-c _" (lambda () (interactive) (dired-do-rename-regexp "^_" ""))))  ;remove leading underscore

;; (with-eval-after-load 'copilot  (keymap-set copilot-completion-map "M-<tab>" 'copilot-accept-completion)
;;   (keymap-set copilot-completion-map "C-<tab>" 'copilot-accept-completion-by-word)
;;   (keymap-set copilot-completion-map "C-<next>" 'copilot-next-completion)
;;   (keymap-set copilot-completion-map "C-<prior>" 'copilot-previous-completion))

(with-eval-after-load 'elfeed
  ;; (elfeed-load-opml "~/doc/elfeed.opml")
  (load "~/doc/elfeed.el")
  (setq elfeed-search-filter "@2-weeks-ago +unread")
  (define-key elfeed-search-mode-map "d" #'elfeed-search-untag-all-unread)
  (define-key elfeed-show-mode-map "d" #'elfeed-kill-buffer)
  (define-key elfeed-show-mode-map "r" #'elfeed-kill-buffer))

(with-eval-after-load 'eww
  (keymap-set eww-mode-map "i" #'eww-toggle-images))

(with-eval-after-load 'flymake
  (keymap-set flymake-mode-map "C-c C-n" #'flymake-goto-next-error)
  (keymap-set flymake-mode-map "C-c C-p" #'flymake-goto-prev-error))

(with-eval-after-load 'forge
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

(with-eval-after-load 'isearch
  (setq isearch-lax-whitespace t)        ;space matches any non-word
  (setq search-whitespace-regexp ".*?")) ;very loose matching

(with-eval-after-load 'magit
  (setq magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1))

(with-eval-after-load 'chatgpt-shell
  (autoload 'auth-source-pick-first-password "auth-sources" nil t)
  (setq chatgpt-shell-openai-key (auth-source-pick-first-password :host "api.openai.com")))
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
  (setq org-agenda-custom-commands '(("h" "Home" ((agenda "") (alltodo "")) ((org-agenda-files '("home.org"))))))
  (setq org-agenda-files '("work.org" "~/doc/ical"))
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

(with-eval-after-load 'project
  (defun project-vterm ()
    (interactive)
    (let ((default-directory (project-root (project-current t))))
      (vterm-toggle)))
  (setq project-switch-commands
        '((project-switch-to-buffer "buffer" ?b)
          (project-dired "dir" ?d)
          (project-find-file "file" ?f)
          (project-kill-buffers "kill" ?k)
          (project-list-buffers "list" ?l)
          (magit-project-status "magit" ?m)
          (rg-project "rg" ?r)
          (project-vterm "vterm" ?t))))

(with-eval-after-load 'selected
  (add-to-list 'selected-ignore-modes 'magit-status-mode)
  (add-to-list 'selected-ignore-modes 'magit-refs-mode)
  ;; (keymap-set selected-keymap "$" #'ispell-region)
  ;; (keymap-set selected-keymap "%" #'query-replace)
  (keymap-set selected-keymap "'" #'insert-pair)
  (keymap-set selected-keymap "\"" #'insert-pair)
  (keymap-set selected-keymap "(" #'insert-pair)
  (keymap-set selected-keymap "[" #'insert-pair)
  (keymap-set selected-keymap "{" #'insert-pair)
  (keymap-set selected-keymap "*" #'calc-grab-region)
  (keymap-set selected-keymap ";" #'comment-region)
  (keymap-set selected-keymap "<tab>" #'indent-region)
  (keymap-set selected-keymap "C-<tab>" #'indent-rigidly)
  (keymap-set selected-keymap "E" #'eww-search-words)
  (keymap-set selected-keymap "N" #'narrow-to-region)
  (keymap-set selected-keymap "R" #'reverse-region)
  (keymap-set selected-keymap "S" #'sort-lines)
  (keymap-set selected-keymap "U" #'upcase-region)
  ;; (keymap-set selected-keymap "a" #'beginning-of-visual-line)
  (keymap-set selected-keymap "b" #'backward-sexp)
  (keymap-set selected-keymap "c" #'capitalize-region)
  (keymap-set selected-keymap "d" #'(lambda () (interactive) (down-list 1 t) (mark-sexp)))
  ;; (keymap-set selected-keymap "e" #'end-of-visual-line)
  (keymap-set selected-keymap "f" #'forward-sexp)
  ;; (keymap-set selected-keymap "g" #'keyboard-quit)
  ;; (keymap-set selected-keymap "h" #'mark-paragraph)
  (keymap-set selected-keymap "i" #'append-to-file)
  (keymap-set selected-keymap "j" #'forward-to-word)
  (keymap-set selected-keymap "k" #'kill-region)
  (keymap-set selected-keymap "l" #'downcase-region)
  (keymap-set selected-keymap "m" #'forward-sexp)
  (keymap-set selected-keymap "n" #'next-line)
  (keymap-set selected-keymap "p" #'previous-line)
  (keymap-set selected-keymap "q" #'selected-off)
  (keymap-set selected-keymap "r" ctl-x-r-map)
  ;; (keymap-set selected-keymap "s" #'isearch-forward)
  (keymap-set selected-keymap "u" #'(lambda () (interactive) (backward-up-list 1 t t) (mark-sexp)))
  (keymap-set selected-keymap "w" #'copy-region-as-kill)
  (keymap-set selected-keymap "x" #'exchange-point-and-mark)
  (keymap-set selected-keymap "y" #'duplicate-dwim)
  ;; (keymap-set selected-keymap "z" #'zap-up-to-char)
)

(with-eval-after-load 'terraform-mode
  (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))

(with-eval-after-load 'vterm
  (setq vterm-buffer-name-string "*vterm %s*") ;include shell title in buffer name
  (setq vterm-copy-mode-remove-fake-newlines t)
  (setq vterm-shell "screen")
  (keymap-set vterm-mode-map "C-t" nil)
  (keymap-set vterm-mode-map "C-c t" #'vterm)
  (keymap-set vterm-mode-map "C-<return>" #'vterm-copy-mode)
  (keymap-set vterm-copy-mode-map "C-<return>" #'vterm-copy-mode))

(with-eval-after-load 'webjump
  (load "init-webjump"))

(add-to-list 'load-path "~/src/emacs.d")
(autoload 'min-theme "min-theme" nil t)
(add-hook 'window-setup-hook #'min-theme)

(add-hook 'window-setup-hook #'url-handler-mode)
;; (add-hook 'emacs-startup-hook #'ido-mode)
(add-hook 'emacs-startup-hook #'minibuffer-depth-indicate-mode)
(add-hook 'emacs-startup-hook #'selected-global-mode)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(run-with-idle-timer 5 nil #'global-anzu-mode)
(run-with-idle-timer 5 nil #'winner-mode)
(run-with-idle-timer 10 nil #'pixel-scroll-mode)
(run-with-idle-timer 60 nil #'midnight-mode)
(run-with-idle-timer 60 nil #'recentf-mode)

(defun translate-gui-keys ()
  "Translate some keys that can be differentiated in gui frames."
  (when (display-graphic-p)
    (keyboard-translate ?\C-i ?\H-i)
    (keyboard-translate ?\C-m ?\H-m)
    (keymap-global-set "H-i" #'project-find-file)
    (keymap-global-set "H-m" #'mark-sexp-at-point)))

(defun split-window-toggle ()
  "Split window if there is just one, else delete other windows."
  (interactive)
  (if (= (count-windows) 1)
      (progn (split-window-right) (other-window 1))
    (delete-other-windows)))

;; (defun kill-whole-line-or-region ()
;;   "Kill whole line, or region if active."
;;   (interactive)
;;   (if (region-active-p)
;;       (kill-region (region-beginning) (region-end))
;;     (kill-whole-line)))

;; (defun copy-whole-line-or-region ()
;;   "Copy whole line, or region if active."
;;   (interactive)
;;   (if (region-active-p)
;;       (kill-ring-save (mark) (point))
;;     (kill-ring-save (line-beginning-position) (line-end-position))))

(add-hook 'server-after-make-frame-hook #'translate-gui-keys) ;server initial frame
(add-hook 'after-init-hook #'translate-gui-keys)              ;non-server

(add-to-list 'load-path "~/src/emacs.d")
(autoload 'min-theme "min-theme" nil t)

(add-hook 'window-setup-hook #'min-theme)
(add-hook 'window-setup-hook #'url-handler-mode)
(add-hook 'window-setup-hook #'ido-mode)
(add-hook 'window-setup-hook #'selected-global-mode)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(run-with-idle-timer 5 nil #'global-anzu-mode)
(run-with-idle-timer 5 nil #'winner-mode)
(run-with-idle-timer 10 nil #'pixel-scroll-mode)
(run-with-idle-timer 10 nil #'minibuffer-depth-indicate-mode)
(run-with-idle-timer 60 nil #'midnight-mode)
(run-with-idle-timer 60 nil #'recentf-mode)

(keymap-global-set "<remap> <dabbrev-expand>" #'hippie-expand)
(keymap-global-set "<remap> <move-beginning-of-line>" #'mwim-beginning)
(keymap-global-set "<remap> <move-end-of-line>" #'mwim-end)

;; (keymap-global-set "<remap> <kill-ring-save>" #'copy-whole-line-or-region)
;; (keymap-global-set "<remap> <kill-region>" #'kill-region)
;; (keymap-global-set "<remap> <kill-region>" #'kill-whole-line-or-region)

(keymap-global-set "<home>" #'beginning-of-buffer)
(keymap-global-set "<end>" #'end-of-buffer)

(keymap-global-set "C-," #'previous-buffer)
(keymap-global-set "C-." #'next-buffer)
(keymap-global-set "C-;" #'comment-line)
(keymap-global-set "C-=" #'quick-calc)
(keymap-global-set "C-\\" #'mark-line)
(keymap-global-set "C-j" #'forward-to-word)
(keymap-global-set "C-t" #'switch-to-buffer)
(keymap-global-set "C-z" #'project-switch-project)

;; (keymap-global-set "C-c a" #'org-agenda-list)
(keymap-global-set "C-c b" #'project-switch-to-buffer)
(keymap-global-set "C-c c" #'org-capture)
(keymap-global-set "C-c d" #'duplicate-dwim)
(keymap-global-set "C-c e" #'link-hint-open-eww)
(keymap-global-set "C-c f" #'avy-goto-char-in-line)
(keymap-global-set "C-c g" #'magit-file-dispatch)
(keymap-global-set "C-c i" #'org-store-link)
(keymap-global-set "C-c j" #'avy-goto-char)
(keymap-global-set "C-c k" #'kill-whole-line)
(keymap-global-set "C-c L" #'link-hint-copy-link)
(keymap-global-set "C-c l" #'link-hint-open-link)
(keymap-global-set "C-c m" #'mu4e)
(keymap-global-set "C-c p" #'project-switch-project)
(keymap-global-set "C-c R" #'code-review-link)
(keymap-global-set "C-c r" #'rg)
(keymap-global-set "C-c s" #'magit-branch-checkout)
(keymap-global-set "C-c t" #'vterm-toggle)
(keymap-global-set "C-c T" #'vterm)
(keymap-global-set "C-c u" #'winner-undo)
(keymap-global-set "C-c v" #'vertico-mode)
(keymap-global-set "C-c o" #'org-agenda)
(keymap-global-set "C-c y" #'browse-kill-ring)
;; (keymap-global-set "C-c C-n" #'diff-hl-next-hunk)
;; (keymap-global-set "C-c C-p" #'diff-hl-previous-hunk)

(keymap-global-set "C-h C-," #'split-window-toggle)
(keymap-global-set "C-h j" #'webjump)

;; (keymap-global-set "M-g r" #'revert-buffer)
;; (keymap-global-set "M-g t" #'(lambda () (interactive) (ibuffer nil nil '((used-mode . vterm-mode)))))
(keymap-global-set "s-<up>" #'enlarge-window)
(keymap-global-set "s-<down>" #'shrink-window)
(keymap-global-set "s-<right>" #'enlarge-window-horizontally)
(keymap-global-set "s-<left>" #'shrink-window-horizontally)
(keymap-global-set "s-o" #'other-window)
(keymap-global-set "s-\\" #'delete-other-windows)
(keymap-global-set "C-<tab>" #'completion-at-point)

(keymap-set ctl-x-map "d" #'dired-jump)
(keymap-set ctl-x-map "g" #'magit-status)
(keymap-set ctl-x-map "k" #'kill-current-buffer)
(keymap-set ctl-x-map "m" #'smex)
(keymap-set ctl-x-map "M" #'smex-major-mode-commands)
(keymap-set ctl-x-map "C-r" #'recentf-open)

(keymap-set ctl-x-r-map "a" #'append-to-register)
(keymap-set ctl-x-r-map "p" #'prepend-to-register)

(keymap-set esc-map "'" #'insert-pair)
(keymap-set esc-map "\"" #'insert-pair)
(keymap-set esc-map "c" #'capitalize-dwim)
(keymap-set esc-map "i" #'imenu)
(keymap-set esc-map "j" #'join-line)
(keymap-set esc-map "l" #'downcase-dwim)
(keymap-set esc-map "o" #'other-window)
(keymap-set esc-map "t" #'project-switch-project)
(keymap-set esc-map "u" #'upcase-dwim)

(keymap-set minibuffer-local-must-match-map "C-<up>" #'minibuffer-previous-completion)
(keymap-set minibuffer-local-must-match-map "C-<down>" #'minibuffer-next-completion)
(keymap-set minibuffer-local-must-match-map "C-r" #'minibuffer-previous-completion)
(keymap-set minibuffer-local-must-match-map "C-s" #'minibuffer-next-completion)
(keymap-set minibuffer-local-must-match-map "C-t" #'minibuffer-complete)

(keymap-set minibuffer-local-completion-map "C-r" #'minibuffer-previous-completion)
(keymap-set minibuffer-local-completion-map "C-s" #'minibuffer-next-completion)
(keymap-set minibuffer-local-completion-map "C-t" #'minibuffer-complete)

(keymap-set completion-list-mode-map "C-r" #'previous-completion)
(keymap-set completion-list-mode-map "C-s" #'next-completion)

(define-key completion-in-region-mode-map (kbd "C-r") 'minibuffer-previous-completion)
(define-key completion-in-region-mode-map (kbd "C-s") 'minibuffer-next-completion)

(with-eval-after-load 'selected
  (add-to-list 'selected-ignore-modes 'magit-status-mode)
  (keymap-set selected-keymap "$" #'ispell-region)
  (keymap-set selected-keymap "%" #'query-replace)
  (keymap-set selected-keymap "'" #'insert-pair)
  (keymap-set selected-keymap "\"" #'insert-pair)
  (keymap-set selected-keymap "(" #'insert-pair)
  (keymap-set selected-keymap "[" #'insert-pair)
  (keymap-set selected-keymap "{" #'insert-pair)
  (keymap-set selected-keymap "*" #'calc-grab-region)
  (keymap-set selected-keymap ";" #'comment-region)
  (keymap-set selected-keymap "<tab>" #'indent-region)
  (keymap-set selected-keymap "C-<tab>" #'indent-rigidly)
  (keymap-set selected-keymap "E" #'eww-search-words)
  (keymap-set selected-keymap "N" #'narrow-to-region)
  (keymap-set selected-keymap "R" #'reverse-region)
  (keymap-set selected-keymap "S" #'sort-lines)
  (keymap-set selected-keymap "U" #'upcase-region)
  (keymap-set selected-keymap "a" #'beginning-of-visual-line)
  (keymap-set selected-keymap "b" #'backward-sexp)
  (keymap-set selected-keymap "c" #'capitalize-region)
  (keymap-set selected-keymap "d" #'(lambda () (interactive) (down-list 1 t) (mark-sexp)))
  (keymap-set selected-keymap "e" #'end-of-visual-line)
  (keymap-set selected-keymap "f" #'forward-sexp)
  (keymap-set selected-keymap "g" #'keyboard-quit)
  (keymap-set selected-keymap "h" #'mark-paragraph)
  (keymap-set selected-keymap "i" #'append-to-file)
  (keymap-set selected-keymap "j" #'forward-to-word)
  (keymap-set selected-keymap "k" #'kill-region)
  (keymap-set selected-keymap "l" #'downcase-region)
  (keymap-set selected-keymap "m" #'forward-sexp)
  (keymap-set selected-keymap "n" #'next-line)
  (keymap-set selected-keymap "p" #'previous-line)
  (keymap-set selected-keymap "q" #'selected-off)
  (keymap-set selected-keymap "r" ctl-x-r-map)
  (keymap-set selected-keymap "s" #'isearch-forward)
  (keymap-set selected-keymap "u" #'(lambda () (interactive) (backward-up-list 1 t t) (mark-sexp)))
  (keymap-set selected-keymap "w" #'copy-region-as-kill)
  (keymap-set selected-keymap "x" #'exchange-point-and-mark)
  (keymap-set selected-keymap "y" #'duplicate-dwim)
  (keymap-set selected-keymap "z" #'zap-up-to-char))
