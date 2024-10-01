;;; atm not used
;; TODO figure out what to do with this


(defun my/load-submodule (modname submodname)
  (let ((mod-dir-path (concat my/modules-dir-path (symbol-name modname)))
	(submod-path (concat mod-dir-path "/" (symbol-name submodname) ".el")))
    (require submodname submod-path)))

(defun +modules/browse ()
  (interactive)
  (counsel-find-file "" my/modules-dir-path))

(provide 'implicit-modules)
