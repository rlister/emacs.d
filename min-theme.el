;;; min-theme.el --- Minimalist theme

;; Version: 0

(deftheme min "Minimalist theme")

(custom-theme-set-faces
 'min

 ;; standard faces
 '(default             ((((type tty)) (:foreground "white")) (t (:foreground "azure4" :background "Black"))))
 '(cursor              ((t (:background "PaleGreen"))))
 '(shadow              ((t (:foreground "DarkSlateGray4"))))
 '(success             ((t (:foreground "PaleGreen"))))
 '(warning             ((t (:foreground "DarkKhaki"))))
 '(error               ((t (:foreground "IndianRed"))))
 '(match               ((t (:foreground "RosyBrown" :background "Black"))))
 '(highlight           ((t (:background "grey10" :underline nil))))
 '(link                ((t (:foreground "CornflowerBlue" :underline nil))))
 '(region              ((t (:background "MidnightBlue"))))
 '(vertical-border     ((t (:foreground "grey25"))))
 '(lazy-highlight      ((t (:inherit (warning highlight)))))
 '(secondary-selection ((t (:inherit (warning highlight)))))
 '(trailing-whitespace ((t (:inherit error))))
 '(italic              ((t (:underline nil))))
 '(underline           ((t (:underline nil))))
 '(visible-mark-active ((t (:inherit highlight :underline t))))

 ;; mode-line
 '(mode-line           ((t (:foreground "aquamarine3" :background "grey14" :box nil))))
 '(mode-line-inactive  ((t (:foreground "grey50" :background "grey7" :box nil))))
 '(mode-line-buffer-id ((t (:foreground "PaleGreen"))))
 '(mode-line-highlight ((t (:foreground "Cyan" :box nil :background "grey14"))))
 '(mode-line-emphasis  ((t (:foreground "IndianRed" :background "grey14" :box nil))))

 ;; other parts of frame and ui elements
 '(header-line   ((t (:inherit highlight :foreground "MediumAquamarine"))))
 '(fringe        ((t (:inherit default :background "Black"))))
 '(button        ((t (:inherit link))))
 '(custom-button ((t (:inherit mode-line))))
 '(widget-field  ((t (:inherit mode-line-inactive))))

 ;; gui elements when using lucid
 '(menu ((t (:inherit mode-line))))

 ;; search and replace
 '(isearch       ((t (:inherit success))))
 '(isearch-fail  ((t (:inherit error))))
 '(query-replace ((t (:inherit success))))

 ;; font-lock
 '(font-lock-function-name-face        ((t (:foreground "LightBlue"))))
 '(font-lock-keyword-face              ((t (:foreground "LightSkyBlue"))))
 '(font-lock-type-face                 ((t (:foreground "CornflowerBlue"))))
 '(font-lock-builtin-face              ((t (:foreground "DodgerBlue2"))))
 '(font-lock-constant-face             ((t (:foreground "RoyalBlue"))))
 '(font-lock-string-face               ((t (:foreground "DarkSlateGray4"))))
 '(font-lock-comment-face              ((((type tty)) (:foreground "grey")) (t (:foreground "grey37"))))
 '(font-lock-comment-delimiter-face    ((t (:inherit font-lock-comment-face))))
 '(font-lock-variable-name-face        ((t (:foreground "PaleTurquoise3"))))
 '(font-lock-doc-face                  ((t (:foreground "LightSkyBlue"))))
 '(font-lock-negation-char-face        ((t (:foreground "azure1"))))
 '(font-lock-preprocessor-face         ((t (:foreground "SlateGray3"))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit isearch))))
 '(font-lock-regexp-grouping-construct ((t (:inherit isearch))))
 '(font-lock-warning-face              ((t (:inherit warning))))

 '(minibuffer-prompt ((t (:foreground "aquamarine3"))))

 '(completions-annotations ((t (:inherit warning))))
 '(completions-common-part ((t (:foreground "DodgerBlue2"))))
 '(completions-first-difference ((t (:foreground "MediumPurple2"))))
 '(completions-highlight ((t (:foreground "Cyan"))))

 '(icomplete-first-match ((t (:inherit completions-highlight))))
 '(vertico-current ((t (:inherit completions-highlight))))

 '(hi-yellow ((t (:inherit warning))))
 '(hi-green  ((t (:inherit success))))
 '(hi-pink   ((t (:inherit error))))

 '(sh-heredoc ((t (:inherit font-lock-string-face))))
 '(sh-quoted-exec ((t (:inherit font-lock-preprocessor-face))))

 ;; show-paren
 '(show-paren-match    ((t (:inherit success))))
 '(show-paren-mismatch ((t (:inherit error))))

 ;; man pages
 '(Man-overstrike ((t (:inherit success))))
 '(Man-underline  ((t (:inherit error))))
 '(Man-reverse    ((t (:inherit warning))))

 ;; info
 '(Info-quoted ((t (:inherit markdown-code-face))))

 ;; grep-like modes
 '(wgrep-face ((t (:inherit highlight))))

 '(dired-broken-symlink     ((t (:inherit error))))
 '(dired-async-mode-message ((t (:inherit warning))))
 '(dired-async-message      ((t (:inherit success))))
 '(dired-async-failures     ((t (:inherit error))))

 '(dired-subtree-depth-1-face ((t (:background "gray2" :extend t))))
 '(dired-subtree-depth-2-face ((t (:background "gray4" :extend t))))
 '(dired-subtree-depth-3-face ((t (:background "gray6" :extend t))))
 '(dired-subtree-depth-4-face ((t (:background "gray8" :extend t))))
 '(dired-subtree-depth-5-face ((t (:background "gray10" :extend t))))
 '(dired-subtree-depth-6-face ((t (:background "gray12" :extend t))))

 '(ido-first-match ((t (:foreground "PaleVioletRed"))))
 '(ido-only-match  ((t (:inherit success))))
 '(ido-subdir      ((t (:inherit dired-directory))))

 '(shortdoc-section ((t (:inherit default))))

 ;; org-mode
 '(org-level-1              ((t (:inherit font-lock-function-name-face :height 1.2))))
 '(org-level-2              ((t (:inherit font-lock-keyword-face :height 1.1))))
 '(org-level-3              ((t (:inherit font-lock-type-face))))
 '(org-level-4              ((t (:inherit font-lock-builtin-face))))
 '(org-level-5              ((t (:inherit font-lock-constant-face))))
 '(org-level-6              ((t (:inherit font-lock-string-face))))
 '(org-level-7              ((t (:inherit font-lock-variable-name-face))))
 '(org-level-8              ((t (:inherit font-lock-doc-face))))
 '(org-date                 ((t (:inherit font-lock-string-face))))
 '(org-table                ((t (:inherit default))))
 '(org-done                 ((t (:inherit font-lock-comment-face :strike-through t))))
 '(org-todo                 ((t (:inherit error))))
 '(org-headline-done        ((t (:inherit org-done))))
 '(org-upcoming-deadline    ((t (:inherit warning))))
 '(org-warning              ((t (:inherit warning))))
 '(org-link                 ((t (:inherit link))))
 '(org-list-dt              ((t (:inherit font-lock-variable-name-face))))
 '(org-special-keyword      ((t (:inherit font-lock-comment-face))))
 '(org-scheduled            ((t (:inherit font-lock-comment-face))))
 '(org-scheduled-previously ((t (:inherit default))))
 '(org-scheduled-today      ((t (:inherit default))))
 '(org-table-header         ((t (:inherit mode-line))))
 '(org-time-grid            ((t (:inherit font-lock-comment-face))))

 ;; org-agenda
 '(org-agenda-structure        ((t (:inherit font-lock-comment-face))))
 '(org-agenda-date             ((t (:inherit font-lock-function-name-face :weight bold))))
 '(org-agenda-date-weekend     ((t (:inherit org-agenda-date :weight medium))))
 '(org-agenda-date-today       ((t (:inherit (org-agenda-date highlight)))))
 '(org-agenda-done             ((t (:inherit org-done))))
 '(org-agenda-dimmed-todo-face ((t (:inherit font-lock-comment-face))))
 '(org-agenda-restriction-lock ((t (:inherit warning))))

 ;; inherited by modes using diffs
 '(diff-header            ((t (:inherit (font-lock-type-face highlight)))))
 '(diff-file-header       ((t (:inherit font-lock-type-face))))
 '(diff-added             ((t (:inherit success))))
 '(diff-indicator-added   ((t (:inherit success)))) ;plus/minus symbol
 '(diff-refine-added      ((t (:inherit (success highlight)))))
 '(diff-removed           ((t (:inherit error))))
 '(diff-indicator-removed ((t (:inherit error)))) ;plus/minus symbol
 '(diff-refine-removed    ((t (:inherit (error highlight)))))
 '(diff-context           ((t (:inherit font-lock-comment-face))))

 '(diff-hl-insert ((t (:inherit success))))
 '(diff-hl-change ((t (:inherit warning))))
 '(diff-hl-delete ((t (:inherit error))))

 ;; magit
 '(magit-header                      ((t (:weight bold))))
 '(magit-section-heading             ((t (:inherit font-lock-keyword-face))))
 '(magit-section-highlight           ((t (:inherit highlight))))
 '(magit-item-highlight              ((t (:inherit highlight))))
 '(magit-diff-hunk-heading           ((t (:inherit diff-header))))
 '(magit-diff-hunk-heading-highlight ((t (:inherit diff-header :extend t))))
 '(magit-diff-file-header            ((t (:inherit diff-file-header))))
 '(magit-diff-context                ((t (:inherit diff-context))))
 '(magit-diff-context-highlight      ((t (:inherit (diff-context highlight) :extend t))))
 '(magit-diff-added                  ((t (:inherit diff-indicator-added))))
 '(magit-diff-added-highlight        ((t (:inherit (diff-indicator-added highlight) :extend t))))
 '(magit-diff-removed                ((t (:inherit diff-removed))))
 '(magit-diff-removed-highlight      ((t (:inherit (diff-removed highlight) :extend t))))
 '(magit-filename                    ((t (:inherit fixed-pitch))))
 ;; '(magit-diff-none                   ((t (:foreground "grey37"))))
 ;; '(magit-reflog-commit               ((t (:foreground "PaleGreen"))))

 '(forge-topic-label ((t (:inherit fixed-pitch :box nil :inverse-video nil))))

 '(eshell-prompt        ((t (:inherit link))))
 '(eshell-ls-executable ((t (:weight normal :inherit success))))
 '(eshell-ls-missing    ((t (:weight normal :inherit error))))

  ;; (setq ansi-color-names-vector ["Black" "IndianRed" "PaleGreen" "LightYellow" "RoyalBlue" "Magenta" "CadetBlue" "#839496"]))
 '(term-color-black   ((t (:foreground "SlateGrey"     :background "LightSlateGrey"))))
 '(term-color-red     ((t (:foreground "IndianRed"     :background "IndianRed1"))))
 '(term-color-green   ((t (:foreground "PaleGreen"     :background "PaleGreen1"))))
 '(term-color-yellow  ((t (:foreground "PaleGoldenrod" :background "LightGoldenrod"))))
 '(term-color-blue    ((t (:foreground "DodgerBlue"    :background "DodgerBlue1"))))
 '(term-color-magenta ((t (:foreground "#B5A0FF"       :background "MediumPurple1"))))
 '(term-color-cyan    ((t (:foreground "cyan3"         :background "cyan1"))))
 '(term-color-white   ((t (:foreground "azure4"        :background "azure1"))))

 '(ansi-color-black   ((t (:inherit term-color-black))))
 '(ansi-color-red     ((t (:inherit term-color-red))))
 '(ansi-color-green   ((t (:inherit term-color-green))))
 '(ansi-color-yellow  ((t (:inherit term-color-yellow))))
 '(ansi-color-blue    ((t (:inherit term-color-blue))))
 '(ansi-color-magenta ((t (:inherit term-color-magenta))))
 '(ansi-color-cyan    ((t (:inherit term-color-cyan))))
 '(ansi-color-white   ((t (:inherit term-color-white))))

 ;; vterm ansi faces, fg is ansi 0-7, bg is ansi 8-15
 '(vterm-color-black   ((t (:inherit term-color-black))))
 '(vterm-color-red     ((t (:inherit term-color-red))))
 '(vterm-color-green   ((t (:inherit term-color-green))))
 '(vterm-color-yellow  ((t (:inherit term-color-yellow))))
 '(vterm-color-blue    ((t (:inherit term-color-blue))))
 '(vterm-color-magenta ((t (:inherit term-color-magenta))))
 '(vterm-color-cyan    ((t (:inherit term-color-cyan))))
 '(vterm-color-white   ((t (:inherit term-color-white))))

 '(markdown-code-face ((t (:inherit (font-lock-preprocessor-face fixed-pitch)))))
 '(markdown-line-break-face ((t (:underline nil))))

 '(dictionary-word-definition-face ((t (:inherit default))))
 '(dictionary-reference-face ((t (:inherit font-lock-keyword-face))))

 ;; slack faces (uses lui)
 '(lui-button-face                    ((t (:inherit (link underline)))))
 '(lui-time-stamp-face                ((t (:inherit font-lock-variable-name-face))))
 '(slack-new-message-marker-face      ((t (:inherit font-lock-comment-face :height 0.8))))
 '(slack-message-output-header        ((t (:inherit font-lock-type-face))))
 '(slack-message-output-text          ((t (:inherit font-lock-comment-face))))
 '(slack-message-output-reaction      ((t (:inherit font-lock-comment-face))))
 '(slack-message-mention-face         ((t (:inherit font-lock-string-face))))
 '(slack-message-mention-keyword-face ((t (:inherit font-lock-variable-name-face))))
 '(slack-message-mention-me-face      ((t (:inherit success))))
 '(slack-channel-button-face          ((t (:inherit font-lock-builtin-face))))
 '(slack-select-block-element-face    ((t (:inherit highlight))))
 '(slack-preview-face                 ((t (:inherit highlight :extend t))))
 '(slack-mrkdwn-code-face             ((t (:inherit markdown-code-face))))
 '(slack-mrkdwn-block-face            ((t (:inherit highlight :extend t))))
 '(slack-mrkdwn-code-block-face       ((t (:inherit (markdown-code-face highlight) :extend t))))

 '(weechat-highlight-face ((t (:inherit success))))

 ;; parent faces for various mail and news modes
 '(message-header-name       ((t (:inherit font-lock-comment-face))))
 '(message-header-newsgroups ((t (:inherit font-lock-keyword-face))))
 '(message-header-subject    ((t (:inherit font-lock-function-name-face))))
 '(message-header-to         ((t (:inherit (font-lock-type-face fixed-pitch)))))
 '(message-header-cc         ((t (:inherit (font-lock-type-face fixed-pitch)))))
 '(message-header-other      ((t (:inherit font-lock-variable-name-face))))
 '(message-header-xheader    ((t (:inherit font-lock-comment-face))))

 '(gnus-header-name ((t (:inherit message-header-newsgroups))))
 '(gnus-header-from ((t (:inherit message-header-newsgroups))))
 '(gnus-header-subject ((t (:inherit message-header-subject))))
 '(gnus-header-content ((t (:inherit message-header-to))))
 '(mm-uu-extract ((t (:inherit (font-lock-preprocessor-face fixed-pitch)))))

 ;; suspicious links in gnus/shr
 '(textsec-suspicious ((t (:inherit error))))

 '(mu4e-header-highlight-face ((t (:inherit hl-line))))
 '(mu4e-replied-face          ((t (:inherit font-lock-comment-face))))

 '(shr-selected-link ((t (:inherit warning))))
 '(shr-mark          ((t (:inherit warning))))
 '(shr-h1            ((t (:inherit org-level-1))))
 '(shr-h2            ((t (:inherit org-level-2))))

 '(flyspell-duplicate ((t (:underline (:color "DarkGoldenrod")))))
 '(flyspell-incorrect ((t (:underline (:color "IndianRed1")))))

 '(flymake-error   ((t (:underline nil :inherit error))))
 '(flymake-warning ((t (:underline nil :inherit warning))))

 '(flycheck-error   ((t (:underline nil :inherit error))))
 '(flycheck-warning ((t (:underline nil :inherit warning))))

 ;; elfeed
 '(elfeed-search-date-face         ((t (:inherit message-header-other))))
 '(elfeed-search-title-face        ((t (:inherit font-lock-comment-face :strike-through t))))
 ;; '(elfeed-search-unread-title-face ((t (:inherit default))))
 '(elfeed-search-unread-title-face ((t (:inherit default :strike-through nil))))
 '(elfeed-search-feed-face         ((t (:inherit font-lock-type-face))))
 '(elfeed-search-tag-face          ((t (:inherit font-lock-variable-name-face))))

 ;; avy faces are used by link-hint
 '(avy-lead-face   ((t (:inherit error))))
 '(avy-lead-face-0 ((t (:inherit warning))))
 '(avy-lead-face-1 ((t (:inherit warning))))
 '(avy-lead-face-2 ((t (:inherit warning))))

 '(eww-form-select   ((t (:inherit button))))
 '(eww-form-submit   ((t (:inherit button))))
 '(eww-form-text     ((t (:inherit mode-line))))
 '(eww-form-checkbox ((t (:inherit mode-line))))

 '(w3m-anchor              ((t (:inherit link))))
 '(w3m-image               ((t (:inherit font-lock-comment-face))))
 '(w3m-image-anchor        ((t (:inherit link))))
 '(w3m-arrived-anchor      ((t (:inherit link))))
 '(w3m-current-anchor      ((t (:inherit success))))
 '(w3m-form-button         ((t (:inherit font-lock-comment-face))))
 '(w3m-header-line-title   ((t (:inherit mode-line))))
 '(w3m-header-line-content ((t (:inherit mode-line :family fixed-pitch))))

 '(which-func ((t (:inherit font-lock-function-name-face))))

 '(pabbrev-suggestions-face ((t (:inherit error))))

 '(embrace-help-pair-face ((t (:inherit font-lock-string-face))))
 '(embrace-help-mark-func-face ((t (:inherit font-lock-type-face))))

 '(highlight-indentation-face ((t (:inherit highlight))))
 '(highlight-indentation-current-column-face ((t (:inherit highlight))))

 '(copilot-overlay-face ((t (:inherit font-lock-comment-face))))
)

(provide-theme 'min)

;;; min-theme.el ends here
