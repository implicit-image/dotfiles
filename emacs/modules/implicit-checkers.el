
(use-package flyspell)

(use-package flycheck
  :config
  :hook (after-init . global-flycheck-mode))

(use-package flycheck-inline
  :after flycheck)

(use-package flymake)


(provide 'implicit-checkers)
