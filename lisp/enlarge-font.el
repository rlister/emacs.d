;; font resizing on the fly for whole frame
;; to resize just for buffer, use builtin text-scale-adjust (C-xC-= and C-xC--)
;;
;; tried to use zoom-frm.el like this:
;;     wget http://www.emacswiki.org/emacs/download/frame-fns.el
;;     wget http://www.emacswiki.org/emacs/download/frame-cmds.el
;;     wget http://www.emacswiki.org/emacs/download/zoom-frm.el
;;   (require 'zoom-frm)
;;   (global-set-key (kbd "C-=") `zoom-in)
;;   (global-set-key (kbd "C--") `zoom-out)
;; but it screwed with placement of mew message buffer (kept jumping around),
;; ...
;; so ripped out this part instead
;;
;; FIXME: where is frame-update-faces defined?

(setq enlarge-font-tries 100)

;;;###autoload
(defun enlarge-font (&optional increment frame)
  "Increase size of font in FRAME by INCREMENT.
Interactively, INCREMENT is given by the prefix argument.
Optional FRAME parameter defaults to current frame."
  (interactive "p")
  (setq frame (or frame (selected-frame)))
  (let ((fontname (cdr (assq 'font (frame-parameters frame))))
        (count enlarge-font-tries))
    (setq fontname (enlarged-font-name fontname frame increment))
    (while (and (not (x-list-fonts fontname)) (wholenump (setq count (1- count))))
      (setq fontname (enlarged-font-name fontname frame increment)))
    (unless (x-list-fonts fontname) (error "Cannot change font size"))
    (modify-frame-parameters frame (list (cons 'font fontname)))
    ;; Update faces that want a bold or italic version of the default font.
    (frame-update-faces frame)))

(defun enlarged-font-name (fontname frame increment)
  "FONTNAME, after enlarging font size of FRAME by INCREMENT.
FONTNAME is the font of FRAME."
  (when (query-fontset fontname)
    (let ((ascii (assq 'ascii (aref (fontset-info fontname frame) 2))))
      (when ascii (setq fontname (nth 2 ascii)))))
  (let ((xlfd-fields (x-decompose-font-name fontname)))
    (unless xlfd-fields (error "Cannot decompose font name"))
    (let ((new-size
           (+ (string-to-number (aref xlfd-fields xlfd-regexp-pixelsize-subnum))
              increment)))
      (unless (> new-size 0) (error "New font size is too small: %s" new-size))
      (aset xlfd-fields xlfd-regexp-pixelsize-subnum (number-to-string new-size)))
    ;; Set point size & width to "*", so frame width will adjust to new font size
    (aset xlfd-fields xlfd-regexp-pointsize-subnum "*")
    (aset xlfd-fields xlfd-regexp-avgwidth-subnum "*")
    (x-compose-font-name xlfd-fields)))
