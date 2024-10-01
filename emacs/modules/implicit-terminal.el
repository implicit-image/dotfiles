
(use-package vterm
  :init
  (evil-set-initial-state 'vterm-mode 'insert)
  :hook (vterm-mode . (lambda () (display-line-numbers-mode -1)))
  :general
  (+leader-keys
    "t t" '("Toggle terminal" . vterm)))



(provide 'implicit-terminal)
