(use-package evil-mc)

(use-package evil-multiedit)

(use-package evil-nerd-commenter
  :after evil
  :general
  (evil-visual-state-map
   "g c" 'evilnc-comment-or-uncomment-lines)
  (evil-normal-state-map
   "g c" 'evilnc-comment-or-uncomment-lines))

(use-package editorconfig
  :demand
  :config
  (editorconfig-mode 1))

(use-package undo-tree
  :demand
  :init
  (require 'f)
  (setq undo-tree-history-directory-alist `(("." . ,(f-join user-emacs-directory "undo-tree/"))))
  :config
  (global-undo-tree-mode 1)
  (push '(" *undo-tree*"
	  :width 0.2
	  :position left) popwin:special-display-config)
  :general
  (+leader-keys
    "o u" '("Open undo tree" . undo-tree-visualize)))


(provide 'implicit-editing)
