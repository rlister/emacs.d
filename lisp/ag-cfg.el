;; for ag 0.14+ which supports --color-match, add highlighting
(eval-after-load "ag"
  '(progn
     (setq ag-highlight-search t)))
