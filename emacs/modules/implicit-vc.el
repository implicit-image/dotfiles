


(use-package magit
  :general
  (+leader-keys
    "g g" '("Magit" . magit)))


(use-package magit-todos)

(use-package vdiff)

(use-package diff-hl
  :demand
  :config
  (global-diff-hl-mode)
  :general
  (+leader-keys
    "g d" '("Show diff" . diff-hl-show-hunk)))


(provide 'implicit-vc)
