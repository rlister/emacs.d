(use-package term-projectile
  :ensure t
  :bind
  ("C-z c" . term-projectile-create-new)
  ("C-z n" . term-projectile-backward)
  ("C-z p" . term-projectile-forward)
  ("C-z l" . ric/term-projectile-term-buffer-toggle)
  ("C-z t" . ric/term-projectile-switch-term-project)
  ("C-x t" . ric/term-projectile-switch-term)
  )

(defun ric//term-projectile-string-match (s)
  "Match term-projectile buffer names."
  (string-match "^term -" s))

(defun ric//term-projectile-term-buffers ()
  "List of term buffers in current project."
  (-filter 'ric//term-projectile-string-match (projectile-project-buffer-names)))

;; (defun ric/term-projectile-backward ()
;;   "Switch backward to the next term-projectile ansi-term buffer.
;; Make a new one if none exists."
;;   (interactive)
;;   (message "%s" projectile-project-root)
;;   (term-projectile-switch :delta -1 :symbol (intern (projectile-project-root))))

(defun ric//term-projectile-non-term-buffers ()
  "List of non-term buffers in current project."
  (-remove 'ric//term-projectile-string-match (projectile-project-buffer-names)))

(defun ric//term-projectile-all-term-buffers ()
  "List of all term buffers, regardless of project."
  (-filter 'ric//term-projectile-string-match
           (mapcar (function buffer-name) (buffer-list))))

(defun ric/term-projectile-term-buffer-toggle ()
  "Switch to/from latest term buffer."
  (interactive)
  (switch-to-buffer
   (if (ric//term-projectile-string-match (buffer-name))
       (car (ric//term-projectile-non-term-buffers))
     (car (ric//term-projectile-term-buffers)))))

(defun ric/term-projectile-switch-term-project ()
  "Like ivy-switch-buffer, but for term buffers in this project."
  (interactive)
  (ivy-read (projectile-prepend-project-name "Switch to term: ")
            (ric//term-projectile-term-buffers)
            :action (lambda (x) (switch-to-buffer x))))

(defun ric/term-projectile-switch-term ()
  "Like ivy-switch-buffer, but for all term buffers."
  (interactive)
  (ivy-read "Switch to term: "
            (ric//term-projectile-all-term-buffers)
            :action (lambda (x) (switch-to-buffer x))))