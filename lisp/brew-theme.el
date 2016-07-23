(deftheme brew "Brew theme")

(set-default 'cursor-type 'bar)

(let (
      (brew-fg  "#839496")
      ;; (brew-fg  "#808080")
      (brew-hl  "#333333")
      (brew-bg  "#1A1A1A")
      (brew-bg0 "#0b0b0b")
      (brew-bg0a "#0f0f0f")
      (brew-bg1 "#1b1b1b")
      (brew-bg2 "#2b2b2b")
      (brew-bg3 "#3f3f3f")
      (brew-bg4 "#4f4f4f")
      (brew-bg5 "#5f5f5f")
      ;; (brew-bg5 "#808080")

      (yellow  "#FFFFB6")
      (orange  "#FFD2A7")
      (red     "#cc9393")
      (magenta "#FF73FD")
      ;; (blue    "#6699CC")
      (blue    "#749AF7")
      (cyan    "#96CBFE")
      (green   "#99CC99")

      (yellow-l "#DEB542")
      (red-d    "#990A1B")
      (red-l    "#FF6E64")
      (blue-d   "#446AC7")
      (blue-l   "#69B7F0")
      (green-l  "#B4C342")
      )

  (custom-theme-set-faces
   'brew
   ;; `(default                    ((t (:foreground ,brew-fg :background nil))))
   `(default                    ((t (:foreground ,brew-fg :background "Black"))))
   `(underline                  ((t (:underline nil)))) ;no underlines unless I ask for them

   `(mode-line                  ((t (:foreground nil :background ,brew-bg2))))
   `(mode-line-inactive         ((t (:foreground nil :background ,brew-bg  :slant italic)))) ;:box (:line-width 1 :color ,brew-bg1)))))
   `(mode-line-buffer-id        ((t (:foreground "PaleGreen" :background nil :weight normal))))
   `(mode-line-highlight        ((t (:foreground "Orange"))))
   `(mode-line-emphasis         ((t (:foreground "Cyan"))))

   `(fringe                     ((t (:inherit default))))
   `(header-line                ((t (:inherit default))))
   `(highlight                  ((t (:foreground nil :background ,brew-hl :underline nil))))
   `(hover-highlight            ((t (:foreground ,yellow :underline nil))))

   `(match                      ((t (:foreground ,brew-fg :background ,brew-hl :weight bold))))
   `(menu                       ((t (:background ,brew-hl))))

   `(mouse                      ((t (:inherit default))))
   `(paren                      ((t (:background ,brew-bg5))))
   `(show-paren-match           ((t (:foreground "PaleGreen"))))
   `(show-paren-mismatch        ((t (:foreground "IndianRed"))))

   `(trailing-whitespace        ((t (:inherit font-lock-warning))))
   `(Buffer-menu-buffer         ((t (:inherit default :background ,brew-hl))))
   `(border                     ((t (:background ,brew-bg))))
   `(button                     ((t (:foreground ,blue :background ,brew-bg :box nil))))
   `(cursor                     ((t (:foreground nil :background "PaleGreen"))))
   `(escape-glyph-face          ((t (:foreground ,red))))
   `(minibuffer-prompt          ((t (:foreground ,green))))
   `(header-line                ((t (:background ,brew-hl)))) ;buffer-specific top mode-line
   `(region                     ((t (:background "MidnightBlue"))))
   `(scroll-bar                 ((t (:background ,brew-hl))))
   `(secondary-selection        ((t (:foreground nil :background ,brew-bg5))))
   `(tool-bar                   ((t (:background ,brew-hl))))
   `(vertical-border            ((t (:foreground ,brew-bg2 :background ,brew-bg2)))) ;color of vertical split line
   `(hl-line                    ((t (:background ,brew-bg1)))) ;hl-line-mode

   `(isearch        ((t (:foreground "GoldenRod" :background ,brew-hl :bold nil))))
   `(isearch-fail   ((t (:foreground "IndianRed" :background ,brew-bg :bold nil))))
   `(lazy-highlight ((t (:foreground "GoldenRod" :background ,brew-bg :bold nil))))

   `(link ((t (:foreground "PaleGreen")))) ;this is e.g. package-list, who knows what else

   `(font-lock-builtin-face             ((t (:foreground ,blue :slant italic))))
   `(font-lock-comment-delimiter-face   ((t (:foreground ,brew-bg5))))
   `(font-lock-comment-face             ((t (:foreground ,brew-bg5 :slant italic))))
   `(font-lock-constant-face            ((t (:foreground ,blue :weight normal :slant italic))))
   `(font-lock-doc-face                 ((t (:foreground ,cyan :slant italic))))
   `(font-lock-doc-string-face          ((t (:foreground ,blue :slant italic))))
   `(font-lock-function-name-face       ((t (:foreground ,blue-l :height 1.0))))
   `(font-lock-keyword-face             ((t (:foreground ,green :weight normal))))
   `(font-lock-negation-char-face       ((t (:foreground "#839496"))))
   `(font-lock-preprocessor-face        ((t (:foreground ,blue))))
   `(font-lock-string-face              ((t (:foreground ,cyan :slant italic))))
   `(font-lock-type-face                ((t (:foreground "SlateBlue3"))))
   `(font-lock-variable-name-face       ((t (:foreground ,blue))))
   `(font-lock-warning-face             ((t (:foreground ,orange :weight bold :underline t))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face   ((t (:foreground ,cyan))))
   `(rainbow-delimiters-depth-2-face   ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-3-face   ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-4-face   ((t (:foreground ,green-l))))
   `(rainbow-delimiters-depth-5-face   ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-6-face   ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-7-face   ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-8-face   ((t (:foreground ,green-l))))
   `(rainbow-delimiters-depth-9-face   ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-10-face  ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-11-face  ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-12-face  ((t (:foreground ,red))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,red :background ,brew-hl :inverse-video nil))))

   ;; compilation, also stuff like grep output
   `(compilation-enter-directory-face ((t (:foreground ,green))))
   `(compilation-face                 ((t (:foreground ,brew-fg :underline nil))))
   `(compilation-info-face            ((t (:foreground ,blue))))
   `(compilation-info                 ((t (:foreground ,green :underline nil))))
   `(compilation-leave-directory-face ((t (:foreground ,green))))
   `(compilation-line-number          ((t (:foreground ,brew-bg5))))
   `(compilation-column-number        ((t (:foreground ,brew-bg3))))
   `(compilation-message              ((t (:foreground ,blue))))
   `(compilation-error                ((t (:foreground "IndianRed" :underline nil))))
   `(compilation-warning              ((t (:foreground ,yellow :underline nil))))

   `(Man-overstrike                   ((t (:foreground "PaleGreen"))))
   `(Man-underline                    ((t (:foreground "IndianRed"))))
   `(Man-reverse                      ((t (:foreground ,blue))))

   `(mew-face-header-subject   ((t (:foreground "PaleGreen"))))
   `(mew-face-header-from      ((t (:foreground ,yellow))))
   `(mew-face-header-date      ((t (:foreground "PaleGreen"))))
   `(mew-face-header-to        ((t (:foreground ,cyan))))
   `(mew-face-header-key       ((t (:foreground ,brew-fg))))
   `(mew-face-header-private   ((t (:foreground "PaleGreen"))))
   `(mew-face-header-important ((t (:inherit font-lock-comment))))
   `(mew-face-header-marginal  ((t (:foreground ,brew-fg :weight bold))))
   `(mew-face-header-warning   ((t (:foreground "IndianRed"))))
   `(mew-face-header-xmew      ((t (:inherit font-lock-comment))))
   `(mew-face-header-xmew-bad  ((t (:foreground "IndianRed"))))
   `(mew-face-body-url         ((t (:foreground ,blue))))
   `(mew-face-body-comment     ((t (:inherit font-lock-comment))))
   `(mew-face-body-cite1       ((t (:foreground "PaleGreen"))))
   `(mew-face-body-cite2       ((t (:foreground ,blue))))
   `(mew-face-body-cite3       ((t (:foreground ,orange))))
   `(mew-face-body-cite4       ((t (:foreground ,yellow))))
   `(mew-face-body-cite5       ((t (:foreground "IndianRed"))))
   `(mew-face-mark-review      ((t (:foreground ,blue))))
   `(mew-face-mark-escape      ((t (:foreground "PaleGreen"))))
   `(mew-face-mark-delete      ((t (:foreground "IndianRed" :slant italic))))
   `(mew-face-mark-unlink      ((t (:foreground ,blue))))
   `(mew-face-mark-refile      ((t (:foreground ,yellow))))
   `(mew-face-mark-unread      ((t (:foreground "PaleGreen"))))
   `(mew-face-eof-message      ((t (:foreground "PaleGreen"))))
   `(mew-face-eof-part         ((t (:foreground ,yellow))))

   ;; org-mode
   `(org-level-1          ((t (:foreground ,orange :height 1.1))))
   `(org-level-2          ((t (:foreground "PaleGreen"))))
   `(org-level-3          ((t (:foreground ,blue))))
   `(org-level-4          ((t (:foreground ,yellow))))
   `(org-level-5          ((t (:foreground ,cyan))))
   `(org-level-6          ((t (:foreground "PaleGreen"))))
   `(org-level-7          ((t (:foreground "IndianRed"))))
   `(org-level-8          ((t (:foreground ,blue))))

   `(org-agenda-structure          ((t (:inherit font-lock-comment-face))))
   `(org-agenda-date               ((t (:foreground ,brew-fg :background ,brew-hl :weight bold :box (:line-width 4 :color ,brew-hl) ))) t)
   `(org-agenda-date-weekend       ((t (:inherit org-agenda-date :slant italic))) t)
   `(org-agenda-date-today         ((t (:inherit org-agenda-date :slant italic underline: t))) t)
   `(org-agenda-done               ((t (:foreground ,green))) t)
   `(org-archived                  ((t (:inherit font-lock-comment-face :weight normal))))
   `(org-block                     ((t (:inherit font-lock-comment-face))))
   `(org-block-begin-line          ((t (:inherit font-lock-comment-face :slant italic))))
   `(org-checkbox                  ((t (:background ,brew-bg :foreground ,brew-fg :box (:line-width 1 :style released-button)))))
   `(org-code                      ((t (:inherit font-lock-comment-face))))
   `(org-date                      ((t (:foreground ,blue :slant italic))))
   `(org-done                      ((t (:inherit font-lock-comment-face :weight bold :italic t))))
   `(org-headline-done             ((t (:inherit font-lock-comment-face :weight bold :strike-through t))))
   `(org-ellipsis                  ((t (:inherit font-lock-comment-face))))
   `(org-formula                   ((t (:foreground ,yellow))))
   `(org-headline-done             ((t (:foreground ,green))))
   `(org-hide                      ((t (:foreground ,brew-hl))))
   `(org-link                      ((t (:foreground ,blue :slant italic :underline t))))
   `(org-sexp-date                 ((t (:foreground "SlateBlue3"))))
   `(org-scheduled                 ((t (:foreground ,green))))
   `(org-scheduled-previously      ((t (:foreground ,yellow))))
   `(org-scheduled-today           ((t (:foreground ,blue :weight bold))))
   `(org-special-keyword           ((t (:inherit font-lock-comment-face :weight bold))))
   `(org-table                     ((t (:foreground ,green))))
   `(org-tag                       ((t (:weight bold))))
   `(org-time-grid                 ((t (:foreground ,cyan))))
   `(org-todo                      ((t (:foreground ,red :weight bold))))
   `(org-upcoming-deadline         ((t (:foreground ,yellow ))))
   `(org-warning                   ((t (:foreground ,orange :weight bold :underline t))))
   `(org-habit-clear-face          ((t (:background ,blue-l :foreground ,blue-l))))
   `(org-habit-clear-future-face   ((t (:background ,blue-l))))
   `(org-habit-ready-face          ((t (:background ,green-l :foreground ,green))))
   `(org-habit-ready-future-face   ((t (:background ,green-l))))
   `(org-habit-alert-face          ((t (:background ,yellow :foreground ,yellow-l))))
   `(org-habit-alert-future-face   ((t (:background ,yellow-l))))
   `(org-habit-overdue-face        ((t (:background ,red :foreground ,red-l))))
   `(org-habit-overdue-future-face ((t (:background ,red-l))))
   `(org-agenda-dimmed-todo-face   ((t (:inherit font-lock-comment-face))))
   `(org-agenda-restriction-lock   ((t (:background ,yellow))))
   `(org-clock-overlay             ((t (:background ,yellow))))
   `(org-column                    ((t (:background ,brew-hl :strike-through nil :underline nil :slant normal :weight normal))))
   `(org-column-title              ((t (:background ,brew-hl :underline t :weight bold))))
   `(org-date-selected             ((t (:foreground ,red :inverse-video t))))
   `(org-document-info             ((t (:foreground ,brew-fg))))
   `(org-document-title            ((t (:foreground ,blue  :weight bold :height 1.44))))
   `(org-drawer                    ((t (:foreground ,cyan))))
   `(org-footnote                  ((t (:foreground ,magenta :underline t))))
   `(org-latex-and-export-specials ((t (:foreground ,orange))))
   `(org-mode-line-clock-overrun   ((t (:inherit modeline :background ,red))))

   ;; outline
   `(outline-8 ((t (:inherit default))))
   `(outline-7 ((t (:inherit outline-8 :height 1.0))))
   `(outline-6 ((t (:inherit outline-7 :height 1.0))))
   `(outline-5 ((t (:inherit outline-6 :height 1.0))))
   `(outline-4 ((t (:inherit outline-5 :height 1.0))))
   `(outline-3 ((t (:inherit outline-4 :height 1.0))))
   `(outline-2 ((t (:inherit outline-3 :height 1.0))))
   `(outline-1 ((t (:inherit outline-2 :height 1.1))))

   `(linum ((t (:foreground "#666783"))))

   `(company-tooltip ((t (:background ,brew-hl))))
   `(company-tooltip-selection ((t (:foreground ,yellow-l :background ,brew-hl))))
   `(company-tooltip-common-selection ((t (:foreground ,yellow-l :background ,brew-hl))))

   ;; erc
   `(erc-default-face        ((t (:foreground ,brew-fg))))
   `(erc-direct-msg-face     ((t (:inherit erc-default))))
   `(erc-action-face         ((t (:inherit erc-default-face))))
   `(erc-bold-face           ((t (:weight bold))))
   `(erc-current-nick-face   ((t (:foreground ,blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning))))
   `(erc-error-face          ((t (:inherit font-lock-warning))))
   `(erc-highlight-face      ((t (:inherit hover-highlight))))
   `(erc-input-face          ((t (:foreground ,yellow))))
   `(erc-keyword-face        ((t (:foreground ,blue :weight bold))))
   `(erc-nick-default-face   ((t (:foreground ,blue :weight normal))))
   `(erc-my-nick-face        ((t (:foreground "IndianRed" :weight bold))))
   `(erc-nick-msg-face       ((t (:inherit erc-default))))
   `(erc-notice-face         ((t (:inherit font-lock-comment-face))))
   `(erc-pal-face            ((t (:foreground ,orange :weight bold))))
   `(erc-fool-face           ((t (:inherit erc-default))))
   `(erc-prompt-face         ((t (:inherit font-lock-comment-face))))
   `(erc-timestamp-face      ((t (:foreground "PaleGreen"))))
   `(erc-underline-face      ((t (:underline t))))

   ;; diff
   `(diff-context     ((t :inherit font-lock-comment-face)))
   `(diff-header      ((t :background ,brew-bg3)))
   `(diff-file-header ((t :background ,brew-bg3 :foreground ,cyan)))
   `(diff-hunk-header ((t :background ,brew-hl)))
   `(diff-added       ((t :foreground ,green)))

   `(egg-diff-hunk-header    ((t (:inherit font-lock-comment-face))))
   `(egg-diff-add            ((t (:foreground "PaleGreen" :background ,brew-bg))))
   `(egg-diff-del            ((t (:foreground "IndianRed" :background ,brew-bg))))

   `(magit-header                      ((t (:weight bold))))
   `(magit-section-heading             ((t (:foreground "PaleGreen"))))
   `(magit-item-highlight              ((t (:background "gray15"))))
   `(magit-diff-hunk-heading           ((t (:foreground ,blue-d :background ,brew-bg1))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,blue-d :background ,brew-bg2))))
   `(magit-diff-file-header            ((t (:foreground ,blue))))
   `(magit-diff-added-highlight        ((t (:foreground "PaleGreen" :background "gray15"))))
   `(magit-diff-added                  ((t (:foreground "PaleGreen"))))
   `(magit-diff-removed-highlight      ((t (:foreground "IndianRed" :background "gray15"))))
   `(magit-diff-removed                ((t (:foreground "IndianRed"))))
   `(magit-diff-context-highlight      ((t (:inherit font-lock-comment-face))))
   `(magit-diff-none                   ((t (:foreground ,brew-bg5))))

   `(git-commit-overlong-summary-face     ((t (:foreground ,brew-fg :italic :underline nil))))
   `(git-commit-nonempty-second-line-face ((t (:foreground ,brew-fg :italic :underline nil))))
   `(git-commit-summary-face              ((t (:foreground ,brew-fg))))

   `(git-gutter:added    ((t (:foreground "PaleGreen"))))
   `(git-gutter:modified ((t (:foreground ,yellow))))
   `(git-gutter:deleted  ((t (:foreground "IndianRed"))))

   ;; sr-speedbar
   `(speedbar-directory-face ((t (:foreground ,blue :slant italic))))
   `(speedbar-file-face      ((t (:inherit    default))))
   `(speedbar-button-face    ((t (:foreground ,green))))
   `(speedbar-selected-face  ((t (:foreground ,red))))
   `(speedbar-tag-face       ((t (:foreground ,yellow))))
   `(speedbar-highlight-face ((t (:background ,brew-hl))))

   ;; elscreen
   `(elscreen-tab-current-screen-face ((t (:foreground ,green   :background ,brew-bg3))))
   `(elscreen-tab-control-face        ((t (:foreground ,green   :background ,brew-hl))))
   `(elscreen-tab-other-screen-face   ((t (:foreground ,brew-bg5 :background ,brew-bg2))))

   `(term-color-cyan    ((t (:foreground "#259286"))))
   `(term-color-blue    ((t (:foreground "#21376C7"))))
   ;; `(term-color-red     ((t (:foreground "#CD5C5C"))))
   `(term-color-red     ((t (:foreground "IndianRed"))))
   `(term-color-green   ((t (:foreground "#548B54"))))
   `(term-color-yellow  ((t (:foreground "#A57706"))))
   `(term-color-magenta ((t (:foreground "#C61C6F"))))

   `(ido-first-match    ((t (:weight normal))))
   `(flx-highlight-face ((t (:foreground ,green-l)))) ;for flx-ido-mode char highlights

   `(trailing-whitespace ((t (:background ,brew-bg2))))

   ;; enh-ruby-mode
   `(erm-syn-errline  ((t (:foreground "IndianRed")))) ;flag errors
   `(erm-syn-warnline ((t (:foreground "PaleGreen")))) ;flag errors

   `(hiwin-face ((t (:foreground "#444444" :background "#111111"))))

   ;; `(helm-source-header ((t (:foreground "PaleGreen" :slant italic))))
   `(helm-source-header          ((t (:inherit font-lock-comment-face))))
   `(helm-selection              ((t (:background ,brew-bg2))))
   `(helm-swoop-target-word-face ((t (:foreground "IndianRed"))))
   `(helm-swoop-target-line-face ((t (:background ,brew-bg2))))
   `(helm-candidate-number       ((t (:foreground "GoldenRod")))) ;candidate count in modeline
   `(helm-helper                 ((t (:foreground "PaleGreen"))))
   `(helm-ff-file                ((t (:inherit default))))
   `(helm-buffer-directory       ((t (:inherit dired-directory))))
   `(helm-buffer-file            ((t (:inherit default))))
   `(helm-match                  ((t (:foreground ,green-l))))

   `(ivy-current-match           ((t (:foreground nil :background "SlateBlue4"))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground "GoldenRod"))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground "GoldenRod2"))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground "GoldenRod3"))))
   `(ivy-minibuffer-match-face-4 ((t (:foreground "GoldenRod4"))))

   ;; for highlight-indentation-mode
   `(highlight-indentation-face                ((t (:background ,brew-bg1))))
   `(highlight-indentation-current-column-face ((t (:background ,brew-bg2))))

   ;; flymake
   `(flymake-errline ((t (:underline (:style wave :color "IndianRed")))))

   `(diredp-number      ((t (:foreground ,yellow))))
   `(diredp-file-name   ((t (:inherit default))))
   `(diredp-file-suffix ((t (:foreground "PaleGreen"))))
   `(diredp-date-time   ((t (:foreground ,blue))))
   `(diredp-dir-priv    ((t (:foreground ,cyan))))
   `(diredp-read-priv   ((t (:foreground "IndianRed"))))
   `(diredp-write-priv  ((t (:foreground "PaleGreen"))))
   `(diredp-exec-priv   ((t (:foreground "GoldenRod"))))
   `(diredp-no-priv     ((t (:foreground ,brew-bg5))))
   `(diredp-dir-heading ((t (:foreground ,cyan :background nil))))

   ;; hi-lock mode, e.g. highlight-* commands
   `(hi-yellow ((t (:background "#A57706"))))
   `(hi-blue   ((t (:background "MidnightBlue"))))
   `(hi-green  ((t (:background "#548B54"))))
   `(hi-red    ((t (:background "IndianRed"))))

   `(avy-lead-face   ((t (:foreground "IndianRed"))))
   `(avy-lead-face-0 ((t (:foreground "GoldenRod"))))
   `(avy-lead-face-1 ((t (:foreground "RoyalBlue"))))
   `(avy-lead-face-2 ((t (:foreground "PaleGreen"))))

   `(evil-quickscope-first-face  ((t (:foreground "IndianRed")))) ;first occurence of char
   `(evil-quickscope-second-face ((t (:foreground "GoldenRod")))) ;second occurence

   `(whitespace-newline ((t (:foreground ,brew-bg2))))
   ))

(provide-theme 'brew)

;; Local Variables:
;; no-byte-compile: t
;; End: