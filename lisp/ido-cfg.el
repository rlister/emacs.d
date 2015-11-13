;; (ido-mode t)
;; (ido-everywhere t)

;; display ido results vertically, rather than horizontally, from melp
(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-C-p-up-down) ;allow C-n/p in addition to C-s/r

;; ido-ubiquitous from melpa: use `ido-completing-read' instead of `completing-read' almost everywhere
;; (ido-ubiquitous-mode t)

(setq ido-enable-flex-matching t)
;; (setq ido-use-filename-at-point nil) ;don't try to guess filename from text at point
;; (setq ido-default-file-method   'selected-frame) ;use this frame even when already open in another
;; (setq ido-default-buffer-method 'selected-frame)
;; ;; (setq ido-max-directory-size 100000) ;hope this helps with adms
;; (setq ido-create-new-buffer 'never)  ;do not make new buffers if I typo name
;; (setq ido-use-url-at-point nil)        ;use C-xC-f to open URLs
;; (setq ido-use-virtual-buffers t)     ;remember buffers that were once open

(defun ido-disable-line-trucation ()
  (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;; fat-fingers
;; (define-key global-map "\C-x\C-b" 'ido-switch-buffer) ;; fat-finger C-x b (was list-all-buffers)
;; (define-key global-map "\C-x\C-k" 'ido-kill-buffer)   ;; fat-finger C-x k (was kmacro-edit-macro)

;; use C-p and then C-p and C-n to preview item at cursor in ido
;; wget http://www.emacswiki.org/emacs/download/ido-preview.el
;; (autoload 'ido-preview "ido-preview" nil t)
;; (add-hook 'ido-setup-hook
;;   (lambda()
;;     (define-key ido-completion-map (kbd "C-M-p") (lookup-key ido-completion-map (kbd "C-p")))
;;     (define-key ido-completion-map (kbd "C-M-n") (lookup-key ido-completion-map (kbd "C-n"))) ; currently, this makes nothing. Maybe they'll make C-n key lately.
;;     (define-key ido-completion-map (kbd "C-p") 'ido-preview-backward)
;;     (define-key ido-completion-map (kbd "C-n") 'ido-preview-forward)))

;; flx-ido from melpa
(flx-ido-mode 1)
(setq ido-use-faces nil) ;disable ido faces to see flx highlights.
(setq gc-cons-threshold 20000000)       ;see https://github.com/lewang/flx#gc-optimization

;; ;; make ~ in ido file completion go direct to $HOME
;; (add-hook 'ido-setup-hook
;;  (lambda ()
;;    (define-key ido-file-completion-map
;;      (kbd "~")
;;      (lambda ()
;;        (interactive)
;;        (if (looking-back "/")
;;            (insert "~/")
;;          (call-interactively 'self-insert-command))))))