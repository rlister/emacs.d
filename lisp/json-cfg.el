;; json-mode from melpa
(setq auto-mode-alist (cons '("\\.json.erb$" . json-mode) auto-mode-alist))

;; this mode seems to load js-mode, and so inherits that js-indent-level

;; json.el and json-pretty-print.el for parsing and generating json
;; wget https://raw.github.com/thorstadt/json.el/master/json.el
;; wget https://raw.github.com/thorstadt/json-pretty-print.el/master/json-pretty-print.el
;; (autoload 'json-pretty-print "json-pretty-print" "Pretty-print json in region." t)