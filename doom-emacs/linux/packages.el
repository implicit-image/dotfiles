;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el


(package! emacs-async)
(package! cheat-sh.el
  :recipe (:host github :repo "davep/cheat-sh.el"
           :files ("cheat-sh.el")))

(package! twittering-mode
  :recipe (:host github
           :repo "hayamiz/twittering-mode"
           :files ("twittering-mode.el")))

(package! company-box)

(package! lsp-tailwindcss
  :recipe (:host github
           :repo "merrickluo/lsp-tailwindcss"))


(package! highlight-indentation)
(package! indent-bars
  :recipe (:host github
           :repo "jdtsmith/indent-bars"))


;; ebooks
(package! nov)
(package! djvu )
(package! calibredb)

;; utils
(package! emms)

;; ui
(package! corfu)
(package! corfu-candidate-overlay)
(package! corfu-terminal
  :recipe (:host codeberg
           :repo "akib/emacs-corfu-terminal"))
(package! corfu-doc-terminal
  :recipe (:host codeberg
           :repo "akib/emacs-corfu-doc-terminal"))
(package! color)
(package! ligature)
(package! telephone-line)

;; org enhancements
(package! org-bullets)
(package! org-modern)
(package! org-tidy)
(package! olivetti)
(package! ob-zig
  :recipe (:host github
           :repo "jolby/ob-zig.el"))

(unpin! org-roam)
(package! org-roam-ui)
(package! ox-rss)
;;;  if i get a key
;; (package! mathpix.el
;;   :recipe (:host github
;;            :repo "jethrokuan/mathpix.el"))

;;  search
(package! ido)

;; language support
(package! yuck-mode)
(package! d-mode)
(package! c3-ts-mode
  :recipe (:host github
           :repo "c3lang/c3-ts-mode"
           :files ("c3-ts-mode.el")))

;; jupyter notebooks support
(package! jupyter)

;; nwscript setup
(package! nwscript-mode
  :recipe (:host github
           :repo "implicit-image/nwscript-mode.el"
           :files ("nwscript-mode.el")))
(package! lsp-nwscript
  :recipe (:host github
           :repo "implicit-image/lsp-nwscript.el"
           :files ("lsp-nwscript.el")))

;; powershell
(package! powershell.el
  :recipe (:host github
           :repo "jschaf/powershell.el"
           :files ("powershell.el")))

;; llm integration
(package! ellama)
(package! copilot
  :recipe (:host github
           :repo "copilot-emacs/copilot.el"
           :files ("*.el")))

;; VC
(package! blamer)

;; themes
(package! doom-gruber-darker-theme
  :recipe (:host github
           :repo "implicit-image/doom-gruber-darker-theme"
           :files ("doom-gruber-darker-theme.el")))

(package! gruber-darker-theme)
