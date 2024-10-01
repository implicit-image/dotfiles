
(use-package go-mode
  :hook
  (go-mode . #'lsp))

(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))


(provide 'implicit-go)
