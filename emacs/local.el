
(defvar lc/package-contents-refreshed nil)

(defun lc/refresh-contents-once ()
  (if (not lc/package-contents-refreshed)
    (setq lc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun lc/require (package)
  (when (not (package-installed-p package))
    (lc/refresh-contents-once)
    (package-install package)))
