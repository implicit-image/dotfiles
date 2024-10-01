(use-package general
  :demand
  :config
  (general-evil-setup)
  (general-create-definer +leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")
  (general-create-definer +local-leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC m"
    :global-prefix "M-SPC m")
  ;; replace M-x
  (general-define-key :keymaps '(normal visual emacs insert) "M-x" 'counsel-M-x))


(use-package evil
  :demand
  :init
  (setq evil-want-integration t
	evil-undo-system 'undo-tree
	evil-lookup-func 'woman)
  :config
  (evil-mode 1)
  :general
  (evil-normal-state-map
   "<escape>" 'keyboard-quit)
  (+leader-keys
    "w v" '("Split window vertically" . evil-window-vsplit)
    "w s" '("Split window horizontally" . evil-window-split)))


(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-goggles
  :config
  (evil-goggles-mode)
  (evil-goggles-use-diff-faces))

(use-package vimish-fold
  :after evil)

(use-package evil-vimish-fold
  :after vimish-fold
  :init
  (setq evil-vimish-fold-target-modes '(prog-mode markdown-mode conf-mode text-mode))
  :config
  (global-evil-vimish-fold-mode 1))



(provide 'implicit-evil)

