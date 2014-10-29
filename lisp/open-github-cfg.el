;; git clone https://github.com/shibayu36/emacs-open-github-from-here.git
(add-to-list 'load-path "~/etc/emacs/pkg/emacs-open-github-from-here")
(autoload 'open-github-from-here "open-github-from-here" nil t)
(defalias 'gh 'open-github-from-here)
