(use-package rust-mode
  :init
  (setq rust-indent-offset 4)
  :hook (rust-mode . (lambda () (lsp-deferred)))
  :general
  (+local-leader-keys
    "c r" '("Cargo run" . rust-run)))

(use-package cargo-mode
  :hook
  (rust-mode . cargo-minor-mode)
  :config
  (setq compilation-scroll-output t))


(use-package rustic)

(provide 'implicit-rust)
