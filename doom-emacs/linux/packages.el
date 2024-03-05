;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el



(package! cheat-sh.el
  :recipe (:host github :repo "davep/cheat-sh.el"
           :files ("cheat-sh.el")))
(package! doom-gruber-darker
  :recipe (:host github
           :repo "implicit-image/doom-gruber-darker"
           :files ("doom-gruber-darker-theme.el")))
;; (package! doom-gruber-darker
;;   :recipe (:host github
;;            :repo "implicit-image/doom-gruber-darker"))
(package! twittering-mode
  :recipe (:host github
           :repo "hayamiz/twittering-mode"
           :files ("twittering-mode.el")))
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! gruber-darker-theme
  :recipe (
           :host github
           :repo "rexim/gruber-darker-theme"
           :files ("gruber-darker-theme.el")))
(package! d-mode)
(package! calibredb)
(package! nov)
(package! color)
(package! org-bullets)
(package! ox-rss)
(package! dashboard)
(package! org-modern)
(package! olivetti)
(package! org-tidy)
