(deftheme brew "Brew theme")


(let ((brew-fg  "azure4")
  (custom-theme-set-faces
   'brew
   `(default                    ((t (:foreground ,brew-fg :background "Black"))))
   `(underline                  ((t (:underline nil)))) ;no underlines unless I ask for them

   `(mode-line                  ((t (:foreground nil :background "grey17"))))
   `(mode-line-inactive         ((t (:foreground nil :background "grey10"  :slant italic)))) ;:box (:line-width 1 :color "grey10")))))
   `(mode-line-buffer-id        ((t (:foreground "PaleGreen" :background nil :weight normal))))
   `(mode-line-highlight        ((t (:foreground "Orange"))))
   `(mode-line-emphasis         ((t (:foreground "Cyan"))))

   `(which-func                 ((t (:foreground "SlateGray3")))) ;function lighter in mode-line

   `(fringe                     ((t (:inherit default))))
   `(header-line                ((t (:inherit default))))
   `(highlight                  ((t (:foreground nil :background "grey20" :underline nil))))
   `(hover-highlight            ((t (:foreground "PaleGoldenrod" :underline nil))))

   `(match                      ((t (:foreground ,brew-fg :background "grey20" :weight bold))))
   `(menu                       ((t (:background "grey20"))))

   `(mouse                      ((t (:inherit default))))
   `(paren                      ((t (:background "grey37"))))
   `(show-paren-match           ((t (:foreground "PaleGreen"))))
   `(show-paren-mismatch        ((t (:foreground "IndianRed"))))

   `(trailing-whitespace        ((t (:inherit font-lock-warning))))
   `(Buffer-menu-buffer         ((t (:inherit default :background "grey20"))))
   `(border                     ((t (:background "grey10"))))
   `(button                     ((t (:foreground "CadetBlue" :background "grey10" :box nil))))
   `(cursor                     ((t (:foreground nil :background "PaleGreen"))))
   `(escape-glyph-face          ((t (:foreground "IndianRed"))))
   `(minibuffer-prompt          ((t (:foreground "PaleGreen"))))
   `(header-line                ((t (:background "grey20")))) ;buffer-specific top mode-line
   `(region                     ((t (:background "MidnightBlue"))))
   `(scroll-bar                 ((t (:background "grey20"))))
   `(secondary-selection        ((t (:foreground nil :background "grey37"))))
   `(tool-bar                   ((t (:background "grey20"))))
   `(vertical-border            ((t (:foreground "grey17" :background "grey17")))) ;color of vertical split line
   `(hl-line                    ((t (:background "grey10")))) ;hl-line-mode

   `(isearch        ((t (:foreground "LightGoldenrod" :background "grey20" :bold nil))))
   `(isearch-fail   ((t (:foreground "IndianRed" :background "grey10" :bold nil))))
   `(lazy-highlight ((t (:foreground "DarkGoldenrod" :background "grey10" :bold nil))))

   `(link ((t (:foreground "PaleGreen")))) ;this is e.g. package-list, who knows what else

   `(font-lock-builtin-face             ((t (:foreground "DodgerBlue2" :slant italic))))
   `(font-lock-comment-delimiter-face   ((t (:foreground "grey37"))))
   `(font-lock-comment-face             ((t (:foreground "grey37" :slant italic))))
   `(font-lock-constant-face            ((t (:foreground "RoyalBlue" :weight normal :slant italic))))
   `(font-lock-doc-face                 ((t (:foreground "LightSkyBlue" :slant italic))))
   `(font-lock-doc-string-face          ((t (:foreground "PaleTurquoise" :slant italic))))
   `(font-lock-function-name-face       ((t (:foreground "LightSlateBlue" :height 1.0))))
   `(font-lock-keyword-face             ((t (:foreground "PaleGreen" :weight normal))))
   `(font-lock-negation-char-face       ((t (:foreground "#839496"))))
   `(font-lock-preprocessor-face        ((t (:foreground "SlateGray3"))))
   `(font-lock-string-face              ((t (:foreground "SkyBlue" :slant italic))))
   `(font-lock-type-face                ((t (:foreground "SlateBlue3"))))
   `(font-lock-variable-name-face       ((t (:foreground "PaleTurquoise"))))
   `(font-lock-warning-face             ((t (:foreground "PaleGoldenrod" :weight bold :underline t))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face   ((t (:foreground "cyan"))))
   `(rainbow-delimiters-depth-2-face   ((t (:foreground "yellow"))))
   `(rainbow-delimiters-depth-3-face   ((t (:foreground "blue"))))
   `(rainbow-delimiters-depth-4-face   ((t (:foreground "PaleGreen"))))
   `(rainbow-delimiters-depth-5-face   ((t (:foreground "green"))))
   `(rainbow-delimiters-depth-6-face   ((t (:foreground "yellow"))))
   `(rainbow-delimiters-depth-7-face   ((t (:foreground "blue"))))
   `(rainbow-delimiters-depth-8-face   ((t (:foreground "PaleGreen"))))
   `(rainbow-delimiters-depth-9-face   ((t (:foreground "green"))))
   `(rainbow-delimiters-depth-10-face  ((t (:foreground "yellow"))))
   `(rainbow-delimiters-depth-11-face  ((t (:foreground "blue"))))
   `(rainbow-delimiters-depth-12-face  ((t (:foreground "red"))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground "red" :background "grey20" :inverse-video nil))))

   ;; compilation, also stuff like grep output
   `(compilation-enter-directory-face ((t (:foreground "PaleGreen"))))
   `(compilation-face                 ((t (:foreground ,brew-fg :underline nil))))
   `(compilation-info-face            ((t (:foreground "CornflowerBlue"))))
   `(compilation-info                 ((t (:foreground "PaleGreen" :underline nil))))
   `(compilation-leave-directory-face ((t (:foreground "PaleGreen"))))
   `(compilation-line-number          ((t (:foreground "grey37"))))
   `(compilation-column-number        ((t (:foreground "grey25"))))
   `(compilation-message              ((t (:foreground "CornflowerBlue"))))
   `(compilation-error                ((t (:foreground "IndianRed" :underline nil))))
   `(compilation-warning              ((t (:foreground "PaleGoldenrod" :underline nil))))

   `(Man-overstrike                   ((t (:foreground "PaleGreen"))))
   `(Man-underline                    ((t (:foreground "IndianRed"))))
   `(Man-reverse                      ((t (:foreground "CornflowerBlue"))))

   `(mew-face-header-subject   ((t (:foreground "PaleGreen"))))
   `(mew-face-header-from      ((t (:foreground "PaleGoldenrod"))))
   `(mew-face-header-date      ((t (:foreground "PaleGreen"))))
   `(mew-face-header-to        ((t (:foreground "SkyBlue"))))
   `(mew-face-header-key       ((t (:foreground ,brew-fg))))
   `(mew-face-header-private   ((t (:foreground "PaleGreen"))))
   `(mew-face-header-important ((t (:inherit font-lock-comment))))
   `(mew-face-header-marginal  ((t (:foreground ,brew-fg :weight bold))))
   `(mew-face-header-warning   ((t (:foreground "IndianRed"))))
   `(mew-face-header-xmew      ((t (:inherit font-lock-comment))))
   `(mew-face-header-xmew-bad  ((t (:foreground "IndianRed"))))
   `(mew-face-body-url         ((t (:foreground "CornflowerBlue"))))
   `(mew-face-body-comment     ((t (:inherit font-lock-comment))))
   `(mew-face-body-cite1       ((t (:foreground "PaleGreen"))))
   `(mew-face-body-cite2       ((t (:foreground "blue"))))
   `(mew-face-body-cite3       ((t (:foreground "orange"))))
   `(mew-face-body-cite4       ((t (:foreground "yellow"))))
   `(mew-face-body-cite5       ((t (:foreground "IndianRed"))))
   `(mew-face-mark-review      ((t (:foreground "blue"))))
   `(mew-face-mark-escape      ((t (:foreground "PaleGreen"))))
   `(mew-face-mark-delete      ((t (:foreground "IndianRed" :slant italic))))
   `(mew-face-mark-unlink      ((t (:foreground "blue"))))
   `(mew-face-mark-refile      ((t (:foreground "yellow"))))
   `(mew-face-mark-unread      ((t (:foreground "PaleGreen"))))
   `(mew-face-eof-message      ((t (:foreground "PaleGreen"))))
   `(mew-face-eof-part         ((t (:foreground "yellow"))))

   ;; org-mode
   `(org-level-1          ((t (:foreground "LightSteelBlue" :height 1.1))))
   `(org-level-2          ((t (:foreground "PaleGreen"))))
   `(org-level-3          ((t (:foreground "DodgerBlue"))))
   `(org-level-4          ((t (:foreground "DodgerBlue2"))))
   `(org-level-5          ((t (:foreground "DodgerBlue4"))))
   `(org-level-6          ((t (:foreground "RoyalBlue1"))))
   `(org-level-7          ((t (:foreground "RoyalBlue2"))))
   `(org-level-8          ((t (:foreground "RoyalBlue3"))))

   `(org-agenda-structure          ((t (:inherit font-lock-comment-face))))
   `(org-agenda-date               ((t (:foreground ,brew-fg :background "grey20" :weight bold :box (:line-width 4 :color "grey20") ))) t)
   `(org-agenda-date-weekend       ((t (:inherit org-agenda-date :slant italic))) t)
   `(org-agenda-date-today         ((t (:inherit org-agenda-date :slant italic underline: t))) t)
   `(org-agenda-done               ((t (:foreground "PaleGreen"))) t)
   `(org-archived                  ((t (:inherit font-lock-comment-face :weight normal))))
   `(org-block                     ((t (:inherit font-lock-comment-face))))
   `(org-block-begin-line          ((t (:inherit font-lock-comment-face :slant italic))))
   `(org-checkbox                  ((t (:background "grey10" :foreground ,brew-fg :box (:line-width 1 :style released-button)))))
   `(org-code                      ((t (:inherit font-lock-comment-face))))
   `(org-date                      ((t (:foreground "CornflowerBlue" :slant italic))))
   `(org-done                      ((t (:inherit font-lock-comment-face :weight bold :italic t))))
   `(org-headline-done             ((t (:inherit font-lock-comment-face :weight bold :strike-through t))))
   `(org-ellipsis                  ((t (:inherit font-lock-comment-face))))
   `(org-formula                   ((t (:foreground "PaleGoldenrod"))))
   `(org-headline-done             ((t (:foreground "PaleGreen"))))
   `(org-hide                      ((t (:foreground "grey20"))))
   `(org-link                      ((t (:foreground "LightSlateBlue" :slant italic :underline t))))
   `(org-sexp-date                 ((t (:foreground "SlateBlue3"))))
   `(org-scheduled                 ((t (:foreground "PaleGreen"))))
   `(org-scheduled-previously      ((t (:foreground "PaleGoldenrod"))))
   `(org-scheduled-today           ((t (:foreground "CornflowerBlue"))))
   `(org-special-keyword           ((t (:inherit font-lock-comment-face))))
   `(org-table                     ((t (:foreground "PaleGreen"))))
   `(org-tag                       ((t (:weight bold))))
   `(org-time-grid                 ((t (:foreground "LightBlue"))))
   `(org-todo                      ((t (:foreground "IndianRed" :weight bold))))
   `(org-upcoming-deadline         ((t (:foreground "PaleGoldenrod" ))))
   `(org-warning                   ((t (:foreground "goldenrod" :weight bold :underline t))))
   `(org-habit-clear-face          ((t (:background "MidnightBlue" :foreground "SkyBlue"))))
   `(org-habit-clear-future-face   ((t (:background "CornflowerBlue"))))
   `(org-habit-ready-face          ((t (:background "DarkGreen" :foreground "PaleGreen"))))
   `(org-habit-ready-future-face   ((t (:background "PaleGreen"))))
   `(org-habit-alert-face          ((t (:background "DarkGoldenrod" :foreground "PaleGoldenrod"))))
   `(org-habit-alert-future-face   ((t (:background "DarkGoldenrod"))))
   `(org-habit-overdue-face        ((t (:background "IndianRed4" :foreground "IndianRed1"))))
   `(org-habit-overdue-future-face ((t (:background "IndianRed4"))))
   `(org-agenda-dimmed-todo-face   ((t (:inherit font-lock-comment-face))))
   `(org-agenda-restriction-lock   ((t (:background "PaleGoldenrod"))))
   `(org-clock-overlay             ((t (:background "PaleGoldenrod"))))
   `(org-column                    ((t (:background "grey20" :strike-through nil :underline nil :slant normal :weight normal))))
   `(org-column-title              ((t (:background "grey20" :underline t :weight bold))))
   `(org-date-selected             ((t (:foreground "IndianRed4" :inverse-video t))))
   `(org-document-info             ((t (:foreground ,brew-fg))))
   `(org-document-title            ((t (:foreground "CornflowerBlue"  :weight bold :height 1.44))))
   `(org-drawer                    ((t (:foreground "SkyBlue"))))
   `(org-footnote                  ((t (:foreground "magenta" :underline t))))
   `(org-latex-and-export-specials ((t (:foreground "goldenrod"))))
   `(org-mode-line-clock-overrun   ((t (:inherit modeline :background "IndianRed4"))))

   ;; outline
   `(outline-8 ((t (:inherit default))))
   `(outline-7 ((t (:inherit outline-8 :height 1.0))))
   `(outline-6 ((t (:inherit outline-7 :height 1.0))))
   `(outline-5 ((t (:inherit outline-6 :height 1.0))))
   `(outline-4 ((t (:inherit outline-5 :height 1.0))))
   `(outline-3 ((t (:inherit outline-4 :height 1.0))))
   `(outline-2 ((t (:inherit outline-3 :height 1.0))))
   `(outline-1 ((t (:inherit outline-2 :height 1.1))))

   `(linum ((t (:foreground "grey40"))))

   `(company-tooltip                  ((t (:background "grey20"))))
   `(company-tooltip-selection        ((t (:foreground "goldenrod" :background "grey20"))))
   `(company-tooltip-common-selection ((t (:foreground "goldenrod" :background "grey20"))))

   ;; erc
   `(erc-default-face        ((t (:foreground ,brew-fg))))
   `(erc-direct-msg-face     ((t (:inherit erc-default))))
   `(erc-action-face         ((t (:inherit erc-default-face))))
   `(erc-bold-face           ((t (:weight bold))))
   `(erc-current-nick-face   ((t (:foreground "CornflowerBlue" :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning))))
   `(erc-error-face          ((t (:inherit font-lock-warning))))
   `(erc-highlight-face      ((t (:inherit hover-highlight))))
   `(erc-input-face          ((t (:foreground "PaleGoldenrod"))))
   `(erc-keyword-face        ((t (:foreground "CornflowerBlue" :weight bold))))
   `(erc-nick-default-face   ((t (:foreground "CornflowerBlue" :weight normal))))
   `(erc-my-nick-face        ((t (:foreground "IndianRed" :weight bold))))
   `(erc-nick-msg-face       ((t (:inherit erc-default))))
   `(erc-notice-face         ((t (:inherit font-lock-comment-face))))
   `(erc-pal-face            ((t (:foreground "goldenrod" :weight bold))))
   `(erc-fool-face           ((t (:inherit erc-default))))
   `(erc-prompt-face         ((t (:inherit font-lock-comment-face))))
   `(erc-timestamp-face      ((t (:foreground "PaleGreen"))))
   `(erc-underline-face      ((t (:underline t))))

   ;; diff
   `(diff-context     ((t :inherit font-lock-comment-face)))
   `(diff-header      ((t :background "grey25")))
   `(diff-file-header ((t :background "grey25" :foreground "SkyBlue")))
   `(diff-hunk-header ((t :background "grey20")))
   `(diff-added       ((t :foreground "PaleGreen")))

   `(egg-diff-hunk-header    ((t (:inherit font-lock-comment-face))))
   `(egg-diff-add            ((t (:foreground "PaleGreen" :background "grey10"))))
   `(egg-diff-del            ((t (:foreground "IndianRed" :background "grey10"))))

   `(magit-header                      ((t (:weight bold))))
   `(magit-section-heading             ((t (:foreground "PaleGreen"))))
   `(magit-item-highlight              ((t (:background "gray15"))))
   `(magit-diff-hunk-heading           ((t (:foreground "CornflowerBlue" :background "grey10"))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground "CornflowerBlue" :background "grey17"))))
   `(magit-diff-file-header            ((t (:foreground "CornflowerBlue"))))
   `(magit-diff-added-highlight        ((t (:foreground "PaleGreen" :background "gray15"))))
   `(magit-diff-added                  ((t (:foreground "PaleGreen"))))
   `(magit-diff-removed-highlight      ((t (:foreground "IndianRed" :background "gray15"))))
   `(magit-diff-removed                ((t (:foreground "IndianRed"))))
   `(magit-diff-context-highlight      ((t (:inherit font-lock-comment-face))))
   `(magit-diff-none                   ((t (:foreground "grey37"))))
   `(magit-reflog-commit               ((t (:foreground "PaleGreen"))))

   `(git-commit-overlong-summary-face     ((t (:foreground ,brew-fg :italic :underline nil))))
   `(git-commit-nonempty-second-line-face ((t (:foreground ,brew-fg :italic :underline nil))))
   `(git-commit-summary-face              ((t (:foreground ,brew-fg))))

   `(git-gutter:added    ((t (:foreground "PaleGreen"))))
   `(git-gutter:modified ((t (:foreground "PaleGoldenrod"))))
   `(git-gutter:deleted  ((t (:foreground "IndianRed"))))

   ;; sr-speedbar
   `(speedbar-directory-face ((t (:foreground "CornflowerBlue" :slant italic))))
   `(speedbar-file-face      ((t (:inherit    default))))
   `(speedbar-button-face    ((t (:foreground "PaleGreen"))))
   `(speedbar-selected-face  ((t (:foreground "IndianRed"))))
   `(speedbar-tag-face       ((t (:foreground "PaleGoldenrod"))))
   `(speedbar-highlight-face ((t (:background "grey20"))))

   ;; elscreen
   `(elscreen-tab-current-screen-face ((t (:foreground "PaleGreen" :background "grey25"))))
   `(elscreen-tab-control-face        ((t (:foreground "PaleGreen" :background "grey20"))))
   `(elscreen-tab-other-screen-face   ((t (:foreground "grey37"    :background "grey17"))))

   `(eshell-prompt       ((t (:foreground "RoyalBlue"))))
   `(eshell-ls-directory ((t (:foreground "SkyBlue"))))

   `(term-color-cyan    ((t (:foreground "#259286"))))
   `(term-color-blue    ((t (:foreground "#21376C7"))))
   `(term-color-red     ((t (:foreground "IndianRed"))))
   `(term-color-green   ((t (:foreground "#548B54"))))
   `(term-color-yellow  ((t (:foreground "#A57706"))))
   `(term-color-magenta ((t (:foreground "#C61C6F"))))

   `(ido-first-match    ((t (:weight normal))))
   `(flx-highlight-face ((t (:foreground "PaleGreen"-l)))) ;for flx-ido-mode char highlights

   `(trailing-whitespace ((t (:background "grey17"))))

   ;; enh-ruby-mode
   `(erm-syn-errline  ((t (:foreground "IndianRed")))) ;flag errors
   `(erm-syn-warnline ((t (:foreground "PaleGreen")))) ;flag errors

   `(hiwin-face ((t (:foreground "grey27" :background "grey7"))))

   ;; `(helm-source-header ((t (:foreground "PaleGreen" :slant italic))))
   `(helm-source-header          ((t (:inherit font-lock-comment-face))))
   `(helm-selection              ((t (:background "grey17"))))
   `(helm-swoop-target-word-face ((t (:foreground "IndianRed"))))
   `(helm-swoop-target-line-face ((t (:background "grey17"))))
   `(helm-candidate-number       ((t (:foreground "goldenrod")))) ;candidate count in modeline
   `(helm-helper                 ((t (:foreground "PaleGreen"))))
   `(helm-ff-file                ((t (:inherit default))))
   `(helm-buffer-directory       ((t (:inherit dired-directory))))
   `(helm-buffer-file            ((t (:inherit default))))
   `(helm-match                  ((t (:foreground "PaleGreen"))))

   `(ivy-current-match           ((t (:foreground nil :background "SlateBlue4"))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground "goldenrod"))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground "goldenrod2"))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground "goldenrod3"))))
   `(ivy-minibuffer-match-face-4 ((t (:foreground "goldenrod4"))))

   ;; For highlight-indentation-mode
   `(highlight-indentation-face                ((t (:background "grey10"))))
   `(highlight-indentation-current-column-face ((t (:background "grey17"))))

   ;; flymake
   `(flymake-errline ((t (:underline (:style wave :color "IndianRed")))))

   `(dired-directory    ((t (:foreground "LightSkyBlue"))))
   `(diredp-number      ((t (:foreground "PaleGoldenrod"))))
   `(diredp-file-name   ((t (:inherit default))))
   `(diredp-file-suffix ((t (:foreground "PaleGreen"))))
   `(diredp-date-time   ((t (:foreground "CornflowerBlue"))))
   `(diredp-dir-priv    ((t (:foreground "LightBlue"))))
   `(diredp-read-priv   ((t (:foreground "IndianRed"))))
   `(diredp-write-priv  ((t (:foreground "PaleGreen"))))
   `(diredp-exec-priv   ((t (:foreground "goldenrod"))))
   `(diredp-no-priv     ((t (:foreground "grey37"))))
   `(diredp-dir-heading ((t (:foreground "SkyBlue" :background nil))))

   `(dired-k-directory  ((t (:foreground "RoyalBlue"))))
   `(dired-k-modified   ((t (:foreground "IndianRed"))))
   `(dired-k-commited   ((t (:foreground "PaleGreen")))) ;sic
   `(dired-k-untracked  ((t (:foreground "goldenrod"))))

   ;; hi-lock mode, e.g. highlight-* commands
   `(hi-yellow ((t (:background "#A57706"))))
   `(hi-blue   ((t (:background "MidnightBlue"))))
   `(hi-green  ((t (:background "#548B54"))))
   `(hi-red    ((t (:background "IndianRed"))))

   `(avy-lead-face   ((t (:foreground "IndianRed"))))
   `(avy-lead-face-0 ((t (:foreground "goldenrod"))))
   `(avy-lead-face-1 ((t (:foreground "RoyalBlue"))))
   `(avy-lead-face-2 ((t (:foreground "PaleGreen"))))

   `(evil-quickscope-first-face  ((t (:foreground "IndianRed")))) ;first occurence of char
   `(evil-quickscope-second-face ((t (:foreground "goldenrod")))) ;second occurence

   `(whitespace-newline ((t (:foreground "grey17"))))
   ))

(provide-theme 'brew)

;; Local Variables:
;; no-byte-compile: t
;; End: