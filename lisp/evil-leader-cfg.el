;; previous configs for reference; refactor to use-package is you want evil-leader

;; (require 'evil-leader)
;; (setq evil-leader/in-all-states t)
;; (evil-leader/set-leader "<SPC>")
;; (evil-mode nil) ;; no idea
;; (global-evil-leader-mode)
;; (evil-mode 1)

;; ;; match all the things on %, install evil-matchit from melpa
;; ;(global-evil-matchidfj-mode 1)

;; ;; highlights unique chars on f/F/t/T, install from melpa
;; (global-evil-quickscope-mode 1)

;; end-of-code or line not working with evil-mode so use
;; mwim from melpa
;; (autoload 'mwim-beginning-of-code-or-line "mwim" nil t)
;; (autoload 'mwim-end-of-code-or-line "mwim" nil t)

;; (defun ric-counsel-ag ()
;;   "Call counsel-ag so it will prompt for dir."
;;   (interactive)
;;   (let ((current-prefix-arg '(4)))
;;     (call-interactively 'counsel-ag)))

;; (evil-leader/set-key
;;   "+" 'evil-numbers/inc-at-pt
;;   "-" 'evil-numbers/dec-at-pt
;;   "~" 'vim-empty-lines-mode
;;   ";" 'comment-region-or-line
;;   ;; "?" '(lambda () (interactive) (find-file "~/notes/vim.cheat"))
;;   "A" 'org-agenda
;;   ;; "ag" 'ric-counsel-ag                                ;ag directory
;;   "ap" 'projectile-ag                     ;ag whole project
;;   "ac" 'align-to-colon                    ;see ruby-cfg for defn
;;   "ar" 'align-regexp
;;   "B" 'ivy-switch-buffer
;;   "b" 'counsel-projectile-switch-to-buffer
;;   "c" (lambda () (interactive) (org-capture nil "t") (evil-append-line 1))
;;   "D" 'projectile-dired
;;   "d" 'counsel-projectile-find-dir
;;   "\C-d" 'dired-jump
;;   "f" 'counsel-projectile-find-file
;;   "G" 'git-timemachine-toggle
;;   "g" 'magit-status
;;   "J" 'avy-goto-char-2
;;   "j" 'avy-goto-word-1
;;   ;; "K" 'org-cut-special
;;   "K" 'evil-delete-buffer
;;   "k" 'kill-this-buffer
;;   "L" 'link-hint-open-link ;link-hint from melpa for avy to link
;;   "l" 'linum-mode
;;   "M" 'evil-visual-mark-mode ;from melpa
;;   "n" 'evil-next-buffer
;;   "P" 'counsel-projectile
;;   "p" 'evil-prev-buffer
;;   ;; "q" 'evil-emacs-state
;;   ;; "R" 'helm-all-mark-rings
;;   "r" 'ivy-resume
;;   "S" 'counsel-git-grep
;;   "s" 'counsel-grep-or-swiper
;;   "t" (lambda () (interactive) (find-file "~/notes/inbox.org"))
;;   "u" 'counsel-unicode-char  ;insert unicode chars
;;   "w" 'save-buffer
;;   "x" 'counsel-M-x
;;   ;; "SPC" 'toggle-previous-buffer
;;   ;; )