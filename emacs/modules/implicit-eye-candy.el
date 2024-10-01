(require 'f)

(use-package all-the-icons
  :if (display-graphic-p))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :hook (css-mode . rainbow-mode))

(use-package hl-todo
  :config
  (global-hl-todo-mode 1))

(use-package olivetti)

(use-package doom-gruber-darker-theme
  :demand
  :straight (doom-gruber-darker-theme :type git
                                      :host github
                                      :repo "implicit-image/doom-gruber-darker-theme")
  :after doom-themes)

(use-package doom-themes
  :demand
  :config
  (add-to-list 'custom-theme-load-path (f-join straight-base-dir
                                               "straight"
                                               straight-build-dir
                                               "doom-gruber-darker-theme/"))
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  (load-theme 'doom-gruber-darker t))

(use-package nyan-mode)

(provide 'implicit-eye-candy)
