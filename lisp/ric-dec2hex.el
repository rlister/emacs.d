(defun ric//dec2hex (&rest args)
  "Convert one or more decimals to list of hexadecimals."
  (mapcar (lambda (n) (format "%X" n)) args))

(defun ric/dec2hex (arg)
  "Prompt for a decimal, and print corresponding hexadecimal."
  (interactive "nDecimal: ")
  (message "%s" (car (ric//dec2hex arg))))