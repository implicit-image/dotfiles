

(use-package yasnippet
  :init
  (yas-global-mode))

(use-package yasnippet-snippets)

(use-package eldoc
  :init
  (setq eldoc-echo-area-prefer-doc-buffer t))


(use-package eldoc-box
  ;; TODO: maybe remove some prettify functions from eldoc-box-buffer-hook, it looks wonky
  :config
  (set-face-attribute 'eldoc-box-body nil :inherit 'corfu-default)
  :hook (eldoc-mode . eldoc-box-hover-at-point-mode))

(use-package dap-mode
  :after lsp-mode
  :config (dap-auto-configure-mode))

(use-package compile
  :straight nil)

(provide 'implicit-coding)
