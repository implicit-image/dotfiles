;; TODO: fix tree sitter grammar url
;;(use-package java-ts-mode)

;; (use-package java-ts-mode
;;   :straight nil)



(use-package java-ts-mode
  :hook (java-ts-mode . (lambda () (lsp))))

(use-package lsp-java
  :init
  (setq lsp-java-completion-enabled nil)
  :hook (java-ts-mode . (lambda () (lsp))))

(use-package kotlin-mode)

(use-package scala-mode)

(use-package sbt-mode)

(use-package lsp-metals)

(use-package groovy-mode)

(use-package clojure-mode)

(use-package cider)

(use-package clojure-snippets)

(use-package clj-refactor)

(provide 'implicit-jvm)
