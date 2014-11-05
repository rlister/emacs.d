;; org-present mode

(add-to-list 'load-path "~/code/org-present")
(autoload 'org-present "org-present" nil t)

(eval-after-load "org-present"
  '(progn
     (defalias 'op 'org-present)

     (setq org-present-mode-hook nil)
     (add-hook 'org-present-mode-hook
               (lambda ()
                 ;(org-present-big)
                 (if (equal window-system 'ns)
                     (org-display-inline-images))
                 (org-present-read-only)))

     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-remove-inline-images)
                 (org-present-read-write)))
     ))
