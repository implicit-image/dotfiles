(use-package gleam-ts-mode
  :hook
  (gleam-ts-mode . (lambda () (lsp))))

(add-to-list 'auto-mode-alist '("\\.gleam\\'" . gleam-ts-mode))

(provide 'implicit-gleam)


