
(use-package anaconda-mode)

(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))  ; or lsp-deferred

(use-package python
  :init
  (setq python-indent-offset 4)
  :straight nil)

(provide 'implicit-python)
