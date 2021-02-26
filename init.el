(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(setq org-startup-truncated nil)
(setq inhibit-startup-screen t)
(setq visible-bell 1)
(setq create-lockfiles nil)
;;(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))
(global-display-line-numbers-mode 1)
;;(setq display-line-numbers 'relative)
(tool-bar-mode 0)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(ido-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)
;;(require 'doom-modeline)
;;(doom-modeline-mode 1)

;;indent
(setq highlight-indent-guides-method 'character)
;;(setq highlight-indent-guides-character '"|")
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)


;; agenda view

;;(add-to-list 'org-agenda-files '(("." . "~/.emacs.d/agenda-files")))


;;smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;(global-set-key (kbd "C-i d") 'neotree)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command);
;;haskell mode
(require 'lsp)
(require 'lsp-mode)
(require 'lsp-haskell)
(require 'haskell-mode)

(defun setup-haskell-mode ()
  (setq haskell-process-log t)
   (setq haskell-process-type "cabal-ghci")
  )




(add-hook 'haskell-mode-hook #'setup-haskell-mode)
(add-hook 'haskell-mode-hook 'lsp-mode)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;;rust

(defun setup-rust-mode ()
  (setq lsp-rust-analyzer-server-display-inlay-hints 0)
  (lsp-mode +1)
  (company-mode +1)
   )

(require 'lsp-mode)
(add-hook 'rust-mode-hook #'setup-rust-mode)
(add-hook 'rust-mode-hook #'lsp) 

;;(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)


;;company
(require 'company)
;;(setq company-idle-delay -1)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
(setq company-tooltip-offset-display 1)

	  
(global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;
(setq company-tooltip-align-annotations t)
(global-set-key (kbd "M-p") 'ace-window)




;;tide
(require 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))


(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))


;; pdf
;;(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf))
;;(add-hook 'pdf-view-mode-hook #'pdf-tools-install)

;;javascript
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(add-hook 'js2-mode-hook #'setup-tide-mode)


;;react

(defun setup-react-mode()
  (flycheck-mode +1)
  (eldoc-mode +1)
  (company-mode +1)
  ('lsp)
  )

(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook #'setup-react-mode)

;;json
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;;c



;;cpp




;;python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))





;;org

(require 'org)


;;vterm

;;dired





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
 '(custom-enabled-themes '(doom-palenight))
 '(custom-safe-themes
   '("c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "0e2a7e1e632dd38a8e0227d2227cb8849f877dd878afb8219cb6bcdd02068a52" "7546a14373f1f2da6896830e7a73674ef274b3da313f8a2c4a79842e8a93953e" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "95d0ed21bb0e919be7687a25ad59a1c2c8df78cbe98c9e369d44e65bfd65b167" "aaa4c36ce00e572784d424554dcc9641c82d1155370770e231e10c649b59a074" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "0a41da554c41c9169bdaba5745468608706c9046231bbbc0d155af1a12f32271" "ca70827910547eb99368db50ac94556bbd194b7e8311cfbdbdcad8da65e803be" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "46b2d7d5ab1ee639f81bde99fcd69eb6b53c09f7e54051a591288650c29135b0" "5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" default))
 '(fci-rule-color "#405A61")
 '(frame-brackground-mode 'dark)
 '(jdee-db-active-breakpoint-face-colors (cons "#073642" "#268bd2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#073642" "#859900"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#073642" "#56697A"))
 '(objed-cursor-color "#dc322f")
 '(package-selected-packages
   '(all-the-icons-dired all-the-icons-gnus all-the-icons-ibuffer all-the-icons-ivy all-the-icons-ivy-rich all-the-icons neotree lsp-pyright doom-modeline doom-themes image+ iscroll look-mode image-dired+ company-c-headers company-shell company-web css-eldoc scss-mode monokai-alt-theme highlight-indent-guides org-bullets use-package pdfgrep pdf-tools pdf-view-restore lua-mode magit org-present-remote vterm org-beautify-theme org-present ox-epub org-brain org-noter org json-mode typescript-mode rjsx-mode tide js2-mode web-mode ace-window company-lsp company-racer flycheck flycheck-rust racer cargo rust-mode ac-haskell-process company-ghci company lsp-haskell lsp-mode lsp-ui haskell-mode gruber-darker-theme smex))
 '(pdf-view-midnight-colors (cons "#839496" "#002b36"))
 '(rustic-ansi-faces
   ["#002b36" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
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
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs_saves")))
