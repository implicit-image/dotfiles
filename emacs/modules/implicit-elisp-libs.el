
(use-package f)

(use-package dash)

(use-package async
  :config
  (autoload 'dired-async-mode "dired-async.el" nil t)
  (dired-async-mode 1))

(provide 'implicit-elisp-libs)
