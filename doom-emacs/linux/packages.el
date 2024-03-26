;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el



(package! cheat-sh.el
  :recipe (:host github :repo "davep/cheat-sh.el"
           :files ("cheat-sh.el")))
(package! gruber-darker-theme
  :recipe (:host github
           :repo "implicit-image/gruber-darker-theme"
           :files ("gruber-darker-theme.el")))
(package! twittering-mode
  :recipe (:host github
           :repo "hayamiz/twittering-mode"
           :files ("twittering-mode.el")))
(package! doom-gruber-darker-theme
  :recipe (:host github
           :repo "implicit-image/doom-gruber-darker-theme"
           :files ("doom-gruber-darker-theme.el")))
(package! lsp-tailwindcss :recipe (:host 'github :repo "merrickluo/lsp-tailwindcss"))
(package! color)
;; ebooks
(package! nov)
(package! calibredb)
;; ui
(package! ivy-posframe)
(package! dashboard)
(package! centaur-tabs)
;; org enhancements
(package! org-gcal)
(package! org-bullets)
(package! org-modern)
(package! org-tidy)
(package! olivetti)
;; org publishing
(package! ox-rss)
;; language support
(package! d-mode)
;; llm integration
