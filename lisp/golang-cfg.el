;; these are also set in profile, but make sure all inferior processes get them
(setenv "GOPATH" (concat (getenv "HOME") "/code/go"))
;; (setenv "PATH" (concat (getenv "PATH") ":" "/extra/path/element"))
(setq exec-path (append exec-path (list (expand-file-name (concat (getenv "GOPATH") "/bin")))))

;; godoc is installed to this homebrew location
(add-to-list 'exec-path "/usr/local/opt/go/libexec/bin")

(defun ric-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq tab-width 2)
  (setq indent-tabs-mode 1)
  (setq standard-indent 2)
  ;; (if (not (string-match "go" compile-command))
  ;;     (set (make-local-variable 'compile-command)
  ;;          "go build -v && go test -v && go vet"))
  (set (make-local-variable 'compile-command)
       ;; "go build -v && go test -v && go vet")
       "go build -v")
  ;; (local-set-key (kbd "M-.") 'godef-jump)) ; Godef jump key binding
  (subword-mode)                        ;handle CamelCase
  )

(use-package go-mode
  :config
  (add-hook 'go-mode-hook 'ric-go-mode-hook)
  )

;; (defun godoc (query)
;;   "Show Go documentation for a query, much like M-x man."
;;   (interactive (list (godoc--read-query)))
;;   (unless (string= query "")
;;     (set-process-sentinel
;;      (start-process-shell-command "godoc" (godoc--get-buffer query)
;;                                   (concat "/usr/local/opt/go/libexec/bin/godoc " query))
;;      'godoc--buffer-sentinel)
;;     nil))

;; ;; go get -u github.com/dougm/goflymake
;; (add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
;; (require 'go-flymake)
;; (define-key go-mode-map (kbd "H-e") 'flymake-popup-current-error-menu)

;; ;; M-x compile
;; (setq compilation-ask-about-save nil) ; M-x compile should not prompt for save
;; (global-set-key (kbd "H-c") 'compile)

;; ;; (setq compilation-save-buffers-predicate
;; ;; 			(lambda ()
;; ;; 				(string-prefix-p my-compilation-root (file-truename (buffer-file-name)))))

;; (defun go-run-current-file ()
;; 	"go run on current filename."
;; 	(interactive)
;; 	(shell-command (concat "go run " (buffer-file-name))))
;; (define-key go-mode-map (kbd "H-r") 'go-run-current-file)