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
  :ensure t
  :config
  (add-hook 'go-mode-hook 'ric-go-mode-hook)
  )