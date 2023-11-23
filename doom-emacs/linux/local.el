

(defun lc/require (package)
  (when (not (package-installed-p package))
    (package-install package)))



;; (defun lc/get-org-blurb (file)
;;   )





(provide 'local)
