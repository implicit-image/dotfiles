(use-package cc-mode
  :defer t
  :hook (c-mode . (lambda ()
                          (lsp))))


(use-package irony
  :hook
  (c-mode . irony-mode)
  (c++-ts-mode . irony-mode)
  (objc-mode . irony-mode))

(use-package ccls
  :defer t)

(use-package rtags
  :defer t)


(provide 'implicit-c)


