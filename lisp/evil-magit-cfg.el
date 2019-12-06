;; I used this before switching to evil-magit:

;; ;; in magit start insert mode when editing commit messages
;; (evil-set-initial-state 'magit-log-edit-mode 'insert)
;; (evil-set-initial-state 'git-commit-mode 'insert)

;; ;; use evil bindings in magit
;; (evil-set-initial-state 'magit-status-mode 'motion)
;; (evil-define-key 'motion magit-status-mode-map
;;   "\C-f" 'evil-scroll-page-down
;;   "\C-b" 'evil-scroll-page-up
;;   ;; (kbd "RET") 'magit-visit-item
;;   (kbd "RET") 'magit-diff-visit-file
;;   (kbd "TAB") 'magit-section-toggle
;;   "." 'magit-mark-item
;;   "=" 'magit-diff-with-mark
;;   "C" 'magit-add-log
;;   "l" 'magit-log-popup
;;   "I" 'magit-ignore-item-locally
;;   "S" 'magit-stage-all
;;   "U" 'magit-unstage-all
;;   "X" 'magit-reset-working-tree
;;   "d" 'magit-discard-item
;;   "i" 'magit-ignore-item
;;   "s" 'magit-stage-item
;;   "u" 'magit-unstage-item
;;   "z" 'magit-key-mode-popup-stashing
;;   )

(evil-set-initial-state 'magit-blame-mode 'emacs)
;; (evil-define-key 'motion magit-blame-map
;;   "q" 'magit-blame-mode ;toggle blame mode off
;;   )
;; (evil-set-initial-state 'magit-log-mode 'motion)
;; (evil-define-key 'motion magit-log-mode-map
;;   ;; "q" 'magit-blame-mode ;toggle blame mode off
;;   (kbd "RET") 'magit-show-commit
;;   )

(use-package evil-magit
  :ensure t)