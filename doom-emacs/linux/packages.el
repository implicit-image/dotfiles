;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

(package! calibredb)
(package! nov)
(package! color)
(package! org-bullets)
(package! ox-rss)
(package! dashboard)
(package! cheat-sh.el
  :recipe (:host github :repo "davep/cheat-sh.el"
           :files ("cheat-sh.el")))
(package! gruber-darker-theme
  :recipe (:host github
           :repo "implicit-image/gruber-darker-theme"
           :files ("gruber-darker-theme.el")))
(package! org-modern)
(package! olivetti)
(package! org-tidy)
