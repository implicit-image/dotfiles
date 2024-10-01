

(use-package treesit-auto
  :init
  (setq treesit-auto-install t)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(provide 'implicit-treesitter)
