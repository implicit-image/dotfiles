(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(setq org-startup-truncated nil)
(setq inhibit-startup-screen t)
(setq visible-bell 1)
(setq create-lockfiles nil)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(tool-bar-mode 0)
(menu-bar-mode 0)
(toggle-scroll-bar -1)
(ido-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)


;;(set-frame-parameter (selected-frame) 'alpha '(85 85))
;;(add-to-list 'default-frame-alist '(alpha 85 85))

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)


(when (display-graphic-p)
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

;; (set-face-background 'highlight-indent-guides-odd-face "darkgray")
;; (set-face-background 'highlight-indent-guides-even-face "dimgray")
;; (set-face-foreground 'highlight-indent-guides-character-face "dimgray")



(setq org-publish-project-alist
      '(("jekyll-implicit-image-github-io"
	 :base-directory "~/projects/implicit-image.github.io/org"
	 :base-extension "org"
	 :publishing-directory "~/projects/implicit-image.github.io/deploy"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :with-toc nil
	 :headline-levels 4
	 :auto-preamble nil
	 :auto-sitemap nil
	 :html-extension "html"
	 :body-only t)))  

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-buffer-file-name-style 'truncate-nil)
  (setq doom-modeline-minor-modes t))


(use-package company-mode
  :init (company-quickhelp-mode 1)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-tooltip-offset-display 1)
  (setq company-quickhelp-delay nil)
  (setq company-tooltip-align-annotations t)
  :bind (:map company-mode-map
	      ("C-c h" . company-quickhelp-manual-begin))
  :hook (prog-mode web-mode))


;;calibre
(use-package calibredb
  :defer t
  :init
  (autoload 'calibredb "calibredb")
  :config
  (setq calibredb-root-dir "~/CalibreLibrary/")
  (setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
  (setq calibredb-library-alist '(("~/CalibreLibrary"))))

;;smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;(global-set-key (kbd "C-i d") 'neotree)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command);


(use-package haskell-mode
  :config
  (setq haskell-process-log t)
  (setq haskell-process-type "stack"))


(use-package rust-mode
  :config
  (setq lsp-rust-analyzer-call-info-full 1)
  (setq lsp-rust-analyzer-server-display-inlay-hints 0))

(use-package lsp-mode
  :hook
  (rust-mode haskell-mode rjsx-mode python-mode emacs-lisp-mode typescript-mode gdscript-mode web-mode . (lambda () (lsp))))

(use-package pdf-tools
  :load-path "site-lisp/pdf-tools/lisp"
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query))

(use-package lsp-haskell
  :ensure t
  :hook (haskell-mode . (lambda ()
			  (require 'lsp-haskell)
			  (lsp))))


(use-package lsp-pyright
  :ensure t
  :config (setq lsp-pyright-venv-path "/home/b/.local/share/virtualenvs/")
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))



(use-package irony
  :hook (c++-mode))


;; (use-package web-mode
;;   :hook (html-mode))


;;(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)


;;company
(global-set-key (kbd "M-p") 'ace-window)




;; ;;tide
;; (require 'tide)
;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   (company-mode +1))


;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;; (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))


;; ;;lisp
;; (defun setup-lisp-mode()
;;   (company-mode +1)
;;   (eldoc-mode +1)
;;   )
;; (add-hook 'emacs-lisp-mode-hook #'setup-lisp-mode)

;; ;; pdf

;; ;;javascript
;; ;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; ;;(add-hook 'js2-mode-hook #'setup-tide-mode)


;;react

(defun setup-react-mode()
  (flycheck-mode +1)
  (eldoc-mode +1)
  (company-mode +1)
  )

(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook #'lsp)
(add-hook 'rjsx-mode-hook #'setup-react-mode)

;; ;;json
;; (add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;;c



;;cpp









;;org

(require 'org)


;;vterm

;;dired


;; (defun setup-company-mode()
;;   (setq company-minimum-prefix-length 1)
;;   (setq company-show-numbers t)
;;   (setq company-tooltip-offset-display 1)
;;   (company-quickhelp-mode 1)
;;   (setq company-quickhelp-delay nil)
;;   (setq company-tooltip-align-annotations t)	  
;;   ;;(define-key company-mode-map (kbd "TAB") #'company-indent-or-complete-common)
;;   )

;; agenda view

;;(add-to-list 'org-agenda-files '(("." . "~/.emacs.d/agenda-files")))



;;haskell mode
;; (require 'lsp)
;; (require 'lsp-mode)
;; (require 'lsp-haskell)
;; (require 'haskell-mode)

;; (defun setup-haskell-mode ()
;;   (setq haskell-process-log t)
;;    (setq haskell-process-type "cabal-ghci")
;;   )

;; (add-hook 'haskell-mode-hook #'setup-haskell-mode)
;; (add-hook 'haskell-mode-hook 'lsp-mode)
;; (add-hook 'haskell-mode-hook #'lsp)
;; (setq lsp-haskell-server-path "/home/b/.ghcup/bin/haskell-language-server-wrapper")
;; (add-hook 'haskell-mode-hook 'company-mode)
;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)


;;:hook - to what hook up currently configured mode 


  ;;:config (setq lsp-haskell-server-path "/home/b/.ghcup/bin/haskell-language-server-wrapper")

;;rust


;; (defun setup-rust-mode ()
;;   (setq lsp-rust-analyzer-call-info-full 1)
;;   (setq lsp-rust-analyzer-server-display-inlay-hints 0)
;;   (lsp-mode +1)
;;   (company-mode +1)
;;   (eldoc-mode +1)
;;    )

;; (require 'lsp-mode)
;; (add-hook 'rust-mode-hook #'setup-rust-mode)
;; (add-hook 'rust-mode-hook #'lsp)




;;--custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(beacon-color "#F8BBD0")
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(doom-dark+))
 '(custom-safe-themes
   '("76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" default))
 '(ensime-sem-high-faces
   '((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6")))
 '(evil-emacs-state-cursor '("#D50000" hbar))
 '(evil-insert-state-cursor '("#D50000" bar))
 '(evil-normal-state-cursor '("#F57F17" box))
 '(evil-visual-state-cursor '("#66BB6A" box))
 '(fci-rule-color "#405A61")
 '(frame-brackground-mode 'dark)
 '(highlight-changes-colors '("#ff8eff" "#ab7eff"))
 '(highlight-indent-guides-auto-character-face-perc 20)
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-indent-guides-auto-even-face-perc 25)
 '(highlight-indent-guides-auto-odd-face-perc 15)
 '(highlight-indent-guides-method 'character)
 '(highlight-symbol-colors
   '("#F57F17" "#66BB6A" "#0097A7" "#42A5F5" "#7E57C2" "#D84315"))
 '(highlight-symbol-foreground-color "#546E7A")
 '(highlight-tail-colors
   '(("#323342" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#323342" . 100)))
 '(jdee-db-active-breakpoint-face-colors (cons "#073642" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#073642" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#073642" "#56697A"))
 '(magit-diff-use-overlays nil)
 '(notmuch-search-line-faces
   '(("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t)))
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(objed-cursor-color "#dc322f")
 '(package-selected-packages
   '(multiple-cursors multi-web-mode abyss-theme apropospriate-theme arc-dark-theme badger-theme badwolf-theme cyberpunk-theme darkburn-theme darkmine-theme darkokai-theme dracula-theme exotica-theme atom-dark-theme atom-one-dark-theme dakrone-theme danneskjold-theme darcula-theme dark-krystal-theme dark-mint-theme darkroom darktooth-theme company-irony company-irony-c-headers irony irony-eldoc nim-mode 2048-game charmap gdscript-mode pipenv company-quickhelp unicode-fonts calibredb emoji-display emoji-fontset base16-theme smooth-scrolling jss all-the-icons-dired all-the-icons-gnus all-the-icons-ibuffer all-the-icons-ivy all-the-icons-ivy-rich neotree lsp-pyright doom-modeline doom-themes image+ iscroll look-mode image-dired+ company-c-headers company-shell company-web css-eldoc scss-mode monokai-alt-theme highlight-indent-guides org-bullets use-package pdfgrep pdf-tools pdf-view-restore lua-mode magit org-present-remote vterm org-beautify-theme org-present ox-epub org-brain org-noter org json-mode typescript-mode rjsx-mode tide js2-mode web-mode ace-window company-lsp company-racer flycheck flycheck-rust racer cargo rust-mode ac-haskell-process company-ghci company lsp-haskell lsp-mode lsp-ui haskell-mode gruber-darker-theme smex))
 '(pdf-view-midnight-colors (cons "#839496" "#002b36"))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(rustic-ansi-faces
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(tabbar-background-color "#ffffffffffff")
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background "#002b36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#859900")
    (cons 40 "#959300")
    (cons 60 "#a58e00")
    (cons 80 "#b58900")
    (cons 100 "#bc7407")
    (cons 120 "#c35f0e")
    (cons 140 "#cb4b16")
    (cons 160 "#cd4439")
    (cons 180 "#d03d5d")
    (cons 200 "#d33682")
    (cons 220 "#d63466")
    (cons 240 "#d9334a")
    (cons 260 "#dc322f")
    (cons 280 "#ba3f41")
    (cons 300 "#994d54")
    (cons 320 "#775b67")
    (cons 340 "#405A61")
    (cons 360 "#405A61")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#242728" "#323342" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs_saves")))

