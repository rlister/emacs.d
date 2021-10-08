(setq debug-on-error t)               ;turn on for debugging
(add-to-list 'load-path "~/src/emacs.d")

;; inhibit minibuffer messages for new emacs frame or new emacslient frame
(setq inhibit-startup-echo-area-message "ric")
(setq server-client-instructions nil)

;; answer questions with one char
(if (>= emacs-major-version 28)
    (setq use-short-answers t)
  (fset 'yes-or-no-p 'y-or-n-p))

;; allow disabled commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; modeline display
(setq display-time-24hr-format t)
(display-time-mode 1)
(column-number-mode t)

;; buffer name display
;; (setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-buffer-name-style 'forward)
;; (setq uniquify-buffer-name-style 'post-forward)
;; (setq uniquify-separator " | ")

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq version-control t)
(setq delete-old-versions t)

(transient-mark-mode -1)                ;do not highlight region
(setq select-active-regions nil)        ;do not send all regions to primary
(setq select-enable-primary t)          ;yank from primary set in other apps

;; (setq pop-up-windows t) ;how display-buffer should behave
;; (setq Man-notify-method 'pushy)

;; make forward/backward-sentence more useful
(setq sentence-end-double-space nil)

;; pinentry queries in minibuffer
(setq epg-pinentry-mode 'loopback)

;; highlight matching delimiters
(show-paren-mode 1)
(setq show-paren-when-point-in-periphery t)

(setq scroll-preserve-screen-position t) ;do not lose point
(setq scroll-conservatively 101)         ;do not center point, less jumpy

;; default all programming modes to 2 char indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default sh-basic-offset 2)
(setq-default python-indent 2)
(setq-default js-indent-level 2)
(setq-default css-indent-offset 2)

(add-to-list 'auto-mode-alist '("Staxfile" . ruby-mode))

(setq-default python-check-command "flake8")

;; less garish html rendering
(with-eval-after-load 'shr
  (setq shr-use-fonts nil)
  (setq shr-use-colors nil))

(with-eval-after-load 'cus-edit
  (setq custom-file "~/.emacs.d/custom.el")) ;stop customize from polluting init.el

(with-eval-after-load 'dired
  (setq dired-guess-shell-alist-user '(("\\.pdf\\'" "mupdf")))
  (setq dired-listing-switches "-alh"))

(with-eval-after-load 'isearch
  (setq isearch-lax-whitespace t)       ;space matches any non-word
  (setq search-whitespace-regexp ".*?") ;very loose matching
  (global-anzu-mode +1))

(with-eval-after-load 'project
  (setq project-switch-commands
        '((project-switch-to-buffer "buffer" ?b)
          (project-dired "dir" ?d)
          (project-find-file "file" ?f)
          (magit-project-status "magit" ?m)
          (rg-project "rg" ?r)
          (vterm "vterm" ?t))))

(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (defun package-make-button (text &rest properties)
    "Override hard-coded button face from package.el."
    (apply #'insert-text-button text 'face 'button 'follow-link t properties)))

;; use this for gcalcli rendering
(with-eval-after-load 'ansi-color
  (setq ansi-color-names-vector ["Black" "IndianRed" "PaleGreen" "LightYellow" "RoyalBlue" "Magenta" "CadetBlue" "#839496"]))

(with-eval-after-load 'selectrum
  (selectrum-prescient-mode +1)
  (marginalia-mode +1))

(with-eval-after-load 'marginalia
  (setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  (define-key minibuffer-local-map (kbd "C-=") #'marginalia-cycle))

(with-eval-after-load 'magit
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1))

(with-eval-after-load 'avy
  (setq avy-keys '(?t ?n ?s ?e ?r ?i ?a ?o ?f ?u ?d ?h ?l ?p ?g ?m ?c))) ;colemak-friendly keys

(with-eval-after-load 'org
  (load "init-org"))

(with-eval-after-load 'org-agenda
  (load "init-org-agenda"))

(with-eval-after-load 'org-capture
  (load "init-org-capture"))

(with-eval-after-load 'vterm
  (load "init-vterm"))

(defun ric/mark-args (&optional arg allow-extend)
  "Advise mark-word to move backwards if we are effectively at end of line."
  (if (looking-at "\\W*$")
      (list -1 t)
    (list arg t)))

(advice-add 'mark-word :filter-args #'ric/mark-args)
(advice-add 'mark-sexp :filter-args #'ric/mark-args)

(defun ric/duplicate-line ()
  "Duplicate current line, leaving point in current position."
  (interactive)
  (save-excursion
    (end-of-line)
    (copy-region-as-kill (line-beginning-position) (point))
    (open-line 1)
    (forward-line)
    (yank)))

(with-eval-after-load 'elfeed
  (elfeed-load-opml "~/src/doc/elfeed.opml")
  (setq elfeed-search-filter "@2-weeks-ago +unread")
  (define-key elfeed-show-mode-map "r" #'elfeed-kill-buffer))

(with-eval-after-load 'w3m
  (setq w3m-search-default-engine "duckduckgo")
  (setq w3m-use-favicon nil)
  (setq-default w3m-use-tab nil)
  (setq w3m-display-mode 'plain)
  (define-key w3m-mode-map (kbd "n") #'w3m-next-anchor)
  (define-key w3m-mode-map (kbd "p") #'w3m-previous-anchor)
  (define-key w3m-mode-map (kbd "l") #'w3m-view-previous-page)
  (define-key w3m-mode-map (kbd "x") #'w3m-delete-buffer))

(define-minor-mode no-mouse-mode
  "Minor mode to disable trackpad clicks."
  :lighter " nm"
  :global t
  :keymap
  (let ((map (make-sparse-keymap)))
    (define-key map [mouse-1] #'ignore)
    (define-key map [down-mouse-1] #'ignore)
    (define-key map [mouse-3] #'ignore)
    (define-key map [down-mouse-3] #'ignore)
    map))

(with-eval-after-load 'alert
  (setq alert-default-style 'libnotify))

(add-to-list 'load-path "~/src/gcalcli-mode")
(autoload 'gcalcli-agenda "gcalcli-mode" nil t)
(with-eval-after-load 'gcalcli-mode
  (setq gcalcli-bin "~/.local/bin/gcalcli")
  (setq gcalcli-config-alist
        '((home . "~/.config/gcalcli/home")
          (work . "~/.config/gcalcli/work"))))

(autoload 'mew "mew" nil t)             ;loads mew config from ~/.mew.el

(with-eval-after-load 'slack
  (load "init-slack"))

(add-hook 'after-init-hook #'(lambda () (load-theme 'min t)))
(add-hook 'after-init-hook #'(lambda () (load "ric-keys-mode")));TODO convert to autoload
(add-hook 'after-init-hook #'winner-mode)
(add-hook 'after-init-hook #'selectrum-mode)
(add-hook 'before-save-hook #'delete-trailing-whitespace)
