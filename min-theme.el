(deftheme min "Minimalist theme")

(custom-theme-set-faces
 'min

 ;; font-lock
 '(font-lock-function-name-face        ((t (:foreground "LightBlue"))))
 '(font-lock-keyword-face              ((t (:foreground "LightSkyBlue"))))
 '(font-lock-type-face                 ((t (:foreground "CornflowerBlue"))))
 '(font-lock-builtin-face              ((t (:foreground "DodgerBlue2"))))
 '(font-lock-constant-face             ((t (:foreground "RoyalBlue"))))
 '(font-lock-string-face               ((t (:foreground "DarkSlateGray4"))))
 '(font-lock-comment-face              ((t (:foreground "grey37"))))
 '(font-lock-comment-delimiter-face    ((t (:inherit font-lock-comment-face))))
 '(font-lock-variable-name-face        ((t (:foreground "PaleTurquoise3"))))
 '(font-lock-doc-face                  ((t (:foreground "LightSkyBlue"))))
 '(font-lock-negation-char-face        ((t (:foreground "azure1"))))
 '(font-lock-preprocessor-face         ((t (:foreground "SlateGray3"))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit isearch))))
 '(font-lock-regexp-grouping-construct ((t (:inherit isearch))))
 '(font-lock-warning-face              ((t (:inherit warning))))

 ;; ui elements
 '(custom-button ((t (:inherit mode-line))))
 '(widget-field  ((t (:inherit mode-line-inactive))))

 '(completions-annotations ((t (:inherit font-lock-doc-face))))

 ;; show-paren
 '(show-paren-match    ((t (:inherit success))))
 '(show-paren-mismatch ((t (:inherit error))))

 ;; man pages
 '(Man-overstrike ((t (:inherit success))))
 '(Man-underline  ((t (:inherit error))))
 '(Man-reverse    ((t (:inherit warning))))

 ;; org-mode
 '(org-level-1              ((t (:inherit font-lock-function-name-face :height 1.2))))
 '(org-level-2              ((t (:inherit font-lock-keyword--face :height 1.1))))
 '(org-level-3              ((t (:inherit font-lock-type-face))))
 '(org-level-4              ((t (:inherit font-lock-builtin-face))))
 '(org-level-5              ((t (:inherit font-lock-constant-face))))
 '(org-level-6              ((t (:inherit font-lock-string-face))))
 '(org-level-7              ((t (:inherit font-lock-variable-name-face))))
 '(org-level-8              ((t (:inherit font-lock-doc-face))))
 '(org-date                 ((t (:inherit font-lock-string-face))))
 '(org-done                 ((t (:inherit font-lock-comment-face :strike-through t))))
 '(org-todo                 ((t (:inherit error))))
 '(org-upcoming-deadline    ((t (:inherit warning))))
 '(org-warning              ((t (:inherit warning))))
 '(org-link                 ((t (:inherit link))))
 '(org-special-keyword      ((t (:inherit font-lock-comment-face))))
 '(org-scheduled            ((t (:inherit font-lock-comment-face))))
 '(org-scheduled-previously ((t (:inherit default))))
 '(org-scheduled-today      ((t (:inherit success))))
 '(org-time-grid            ((t (:inherit font-lock-comment-face))))

 ;; org-agenda
 '(org-agenda-structure        ((t (:inherit font-lock-comment-face))))
 '(org-agenda-date             ((t (:inherit font-lock-function-name-face :weight bold))))
 '(org-agenda-date-weekend     ((t (:inherit org-agenda-date :weight normal))))
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

 ;; magit
 '(magit-header                      ((t (:weight bold))))
 '(magit-section-heading             ((t (:inherit font-lock-keyword-face))))
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
 ;; '(magit-diff-none                   ((t (:foreground "grey37"))))
 ;; '(magit-reflog-commit               ((t (:foreground "PaleGreen"))))
 '(magit-section-highlight           ((t (:inherit highlight))))

 ;; vterm ansi faces, fg is ansi 0-7, bg is ansi 8-15
 '(vterm-color-black   ((t (:foreground "SlateGrey"     :background "LightSlateGrey"))))
 '(vterm-color-red     ((t (:foreground "IndianRed"     :background "IndianRed1"))))
 '(vterm-color-green   ((t (:foreground "PaleGreen"     :background "PaleGreen1"))))
 '(vterm-color-yellow  ((t (:foreground "PaleGoldenrod" :background "LightGoldenrod"))))
 '(vterm-color-blue    ((t (:foreground "DodgerBlue"    :background "DodgerBlue1"))))
 '(vterm-color-magenta ((t (:foreground "#B5A0FF"       :background "MediumPurple1"))))
 '(vterm-color-cyan    ((t (:foreground "cyan3"         :background "cyan1"))))
 '(vterm-color-white   ((t (:foreground "azure4"        :background "azure1"))))

 ;; slack faces (uses lui)
 '(lui-button-face                    ((t (:inherit (link underline)))))
 '(lui-time-stamp-face                ((t (:inherit font-lock-variable-name-face))))
 '(slack-new-message-marker-face      ((t (:inherit font-lock-comment-face :height 0.8))))
 '(slack-message-output-header        ((t (:inherit font-lock-type-face))))
 '(slack-message-output-text          ((t (:inherit default))))
 '(slack-message-output-reaction      ((t (:inherit font-lock-comment-face))))
 '(slack-message-mention-face         ((t (:inherit font-lock-string-face))))
 '(slack-message-mention-keyword-face ((t (:inherit font-lock-variable-name-face))))
 '(slack-message-mention-me-face      ((t (:inherit success))))
 '(slack-channel-button-face          ((t (:inherit font-lock-builtin-face))))
 '(slack-select-block-element-face    ((t (:inherit highlight))))
 '(slack-preview-face                 ((t (:inherit highlight :extend t))))
 '(slack-mrkdwn-code-face             ((t (:inherit font-lock-string-face))))
 '(slack-mrkdwn-block-face            ((t (:inherit highlight :extend t))))

 ;; parent faces for various mail and news modes
 '(message-header-name       ((t (:inherit font-lock-comment-face))))
 '(message-header-newsgroups ((t (:inherit font-lock-keyword-face))))
 '(message-header-subject    ((t (:inherit font-lock-function-name-face))))
 '(message-header-to         ((t (:inherit font-lock-type-face))))
 '(message-header-other      ((t (:inherit font-lock-variable-name-face))))
 '(message-header-xheader    ((t (:inherit font-lock-comment-face))))

 ;; mew
 '(mew-face-body-cite1       ((t (:inherit font-lock-comment-face))))
 '(mew-face-body-cite2       ((t (:inherit font-lock-comment-face))))
 '(mew-face-body-cite3       ((t (:inherit font-lock-comment-face))))
 '(mew-face-body-cite4       ((t (:inherit font-lock-comment-face))))
 '(mew-face-body-cite5       ((t (:inherit font-lock-comment-face))))
 '(mew-face-body-url         ((t (:inherit link))))
 '(mew-face-eof-message      ((t (:inherit success))))
 '(mew-face-header-date      ((t (:inherit message-header-other))))
 '(mew-face-header-from      ((t (:inherit message-header-newsgroups))))
 '(mew-face-header-to        ((t (:inherit message-header-to))))
 '(mew-face-header-subject   ((t (:inherit message-header-subject))))
 '(mew-face-header-important ((t (:inherit message-header-name))))
 '(mew-face-header-key       ((t (:inherit message-header-name))))
 '(mew-face-header-marginal  ((t (:inherit message-header-xheader))))
 '(mew-face-header-xmew      ((t (:inherit message-header-xheader))))
 '(mew-face-header-xmew-bad  ((t (:inherit message-header-xheader))))
 '(mew-face-mark-delete      ((t (:inherit error))))
 '(mew-face-mark-refile      ((t (:inherit success))))

 ;; elfeed
 '(elfeed-search-date-face         ((t (:inherit message-header-other))))
 '(elfeed-search-title-face        ((t (:inherit font-lock-comment-face :strike-through t))))
 '(elfeed-search-unread-title-face ((t (:inherit default :weight normal))))
 '(elfeed-search-unread-title-face ((t (:inherit default :strike-through nil))))
 '(elfeed-search-feed-face         ((t (:inherit font-lock-type-face))))
 '(elfeed-search-tag-face          ((t (:inherit font-lock-variable-name-face))))

  ;; avy faces are used by link-hint
 '(avy-lead-face   ((t (:inherit error))))
 '(avy-lead-face-0 ((t (:inherit font-lock-comment-face))))
 '(avy-lead-face-1 ((t (:inherit font-lock-comment-face))))
 '(avy-lead-face-2 ((t (:inherit font-lock-comment-face))))
)

(provide-theme 'min)
