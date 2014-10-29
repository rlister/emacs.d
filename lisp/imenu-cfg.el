;; imenu is in emacs24
;(require 'ido)

;; melpa has idomenu, but this is better on nested javascript prototypes

(require 'imenu)
;(autoload 'ido-imenu-push-mark "imenu" nil t)

(eval-after-load "imenu"
  '(progn
     (setq imenu-auto-rescan t)              ;reindex each call

     ;; make imenu use ido instead of buffers
     ;; https://gist.github.com/2360578
     (defun ido-imenu ()
       "Update the imenu index and then use ido to select a symbol to navigate to.
Symbols matching the text at point are put first in the completion list."
       (interactive)
       (imenu--make-index-alist)
       (let ((name-and-pos '())
             (symbol-names '()))
         (flet ((addsymbols (symbol-list)
                            (when (listp symbol-list)
                              (dolist (symbol symbol-list)
                                (let ((name nil) (position nil))
                                  (cond
                                   ((and (listp symbol) (imenu--subalist-p symbol))
                                    (addsymbols symbol))

                                   ((listp symbol)
                                    (setq name (car symbol))
                                    (setq position (cdr symbol)))

                                   ((stringp symbol)
                                    (setq name symbol)
                                    (setq position (get-text-property 1 'org-imenu-marker symbol))))

                                  (unless (or (null position) (null name))
                                    (add-to-list 'symbol-names name)
                                    (add-to-list 'name-and-pos (cons name position))))))))
           (addsymbols imenu--index-alist))
         ;; If there are matching symbols at point, put them at the beginning of `symbol-names'.
         (let ((symbol-at-point (thing-at-point 'symbol)))
           (when symbol-at-point
             (let* ((regexp (concat (regexp-quote symbol-at-point) "$"))
                    (matching-symbols (delq nil (mapcar (lambda (symbol)
                                                          (if (string-match regexp symbol) symbol))
                                                        symbol-names))))
               (when matching-symbols
                 (sort matching-symbols (lambda (a b) (> (length a) (length b))))
                 (mapc (lambda (symbol)
                         (setq symbol-names (cons symbol (delete symbol symbol-names))))
                       matching-symbols)))))
         (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
                (position (cdr (assoc selected-symbol name-and-pos))))
           (goto-char position))))
     ))

;; push mark when using ido-imenu, lets us return by popping mark: C-u C-SPC
;; https://gist.github.com/2350388
(defvar push-mark-before-goto-char nil)

(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))

(defun ido-imenu-push-mark ()
  (interactive)
  (let ((push-mark-before-goto-char t))
    (ido-imenu)))

;; was bound to beginning-of-buffer
(global-set-key (kbd "M-m") 'ido-imenu-push-mark)
