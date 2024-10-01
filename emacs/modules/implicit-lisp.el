
(use-package lispy
  :disabled
  :hook (emacs-lisp-mode common-lisp-mode))

;; emacs lisp
(use-package elisp-mode
  :straight nil
  :init
  (setq evil-lookup-func 'eldoc)
  :hook
  (elisp-mode . lsp-ui-mode))

;; common lisp
(use-package common-lisp-snippets)

;; racket
(use-package racket-mode)


(provide 'implicit-lisp)
