
(use-package haskell-mode
  :init
  (setq haskell-process-log t
	haskell-process-type 'stack-ghci)
  :general
  (haskell-mode-map
   :states '(normal)
   "K" 'lsp-describe-thing-at-point))


(use-package lsp-haskell
  :hook
  (haskell-mode . #'lsp)
  (literate-haskell-mode . #'lsp))

;; (use-package dante)

(provide 'implicit-haskell)
