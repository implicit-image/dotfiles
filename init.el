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

;;indent

;; (setq highlight-indent-guides-character '"|")
;; (setq highlight-indent-guides-method 'character)
;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)


;; agenda view

;;(add-to-list 'org-agenda-files '(("." . "~/.emacs.d/agenda-files")))


;;smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

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
  )

(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook #'setup-react-mode)

;;json
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;;c



;;cpp




;;





;;org

(require 'org)


;;vterm

;;dired
(add-hook 'dired-mode-hook 'dired-git-mode)





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
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("46b2d7d5ab1ee639f81bde99fcd69eb6b53c09f7e54051a591288650c29135b0" "5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" default))
 '(package-selected-packages
   '(image+ iscroll look-mode dired-git image-dired+ company-c-headers company-shell company-web css-eldoc scss-mode monokai-alt-theme highlight-indent-guides org-bullets use-package pdfgrep pdf-tools pdf-view-restore lua-mode magit org-present-remote vterm org-beautify-theme org-present ox-epub org-brain org-noter org json-mode typescript-mode rjsx-mode tide js2-mode web-mode ace-window company-lsp company-racer flycheck flycheck-rust racer cargo rust-mode ac-haskell-process company-ghci company lsp-haskell lsp-mode lsp-ui haskell-mode gruber-darker-theme smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs_saves")))
