;; misc config for minor languages


(use-package nwscript-mode
  :straight (nwscript-mode :type git
			   :host github
			   :repo "implicit-image/nwscript-mode.el"
			   :files ("nwscript-mode.el")))

(use-package lsp-nwscript
  :straight (lsp-nwscript :type git
			  :host github
			  :repo "implicit-image/lsp-nwscript.el"
			  :files ("lsp-nwscript.el")))

(use-package lua-mode)

(use-package yaml-mode)

(use-package toml-mode)

(use-package nxml-mode
  :straight nil)

(use-package gdscript-mode)

(use-package nim-mode)

(use-package d-mode)

(use-package elm-mode)

(use-package ada-mode)

(use-package crystal-mode)

(use-package dart-mode)

(use-package elm-mode)

(use-package idris-mode)

(use-package purescript-mode)

(use-package nix-mode)


(provide 'implicit-misc-langs)
