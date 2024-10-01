(use-package rg)

(defun +search/rg-thing-at-point ()
  (interactive)
  (let ((s (symbol-at-point)))
    (counsel-rg (if (eq s nil) "" (symbol-name s)))))


(use-package imenu
  :straight nil
  :demand
  :general
  (+leader-keys
    "s i" '("imenu" . imenu)))


(provide 'implicit-search)

