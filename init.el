(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(setq org-startup-truncated nil)
(setq inhibit-startup-screen t)
(setq visible-bell 1)
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))
(global-display-line-numbers-mode 1)
;;(setq display-line-numbers 'relative)
(tool-bar-mode 0)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(ido-mode 1)




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

(setq haskell-process-log t)
(setq haskell-process-type "cabal-ghci")

(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-mode-hook 'lsp-mode)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;;rust

(defun setup-rust-mode ()
  (setq lsp-rust-analyzer-server-display-inlay-hints 0)
  (lsp-mode +1)
  (company-mode +1))

(require 'lsp-mode)
(add-hook 'rust-mode-hook #'setup-rust-mode)




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
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))

(add-hook 'pdf-view-mode-hook 'pdf-tools-install)

;;javascript
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-mode))
(add-hook 'js2-mode-hook #'setup-tide-mode)




;;json
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;;c



;;cpp




;;





;;org

(require 'org)


;;vterm






;;--custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" default))
 '(package-selected-packages
   '(use-package pdfgrep pdf-tools pdf-view-restore lua-mode magit org-present-remote vterm org-beautify-theme org-present ox-epub org-brain org-noter org json-mode typescript-mode rjsx-mode tide js2-mode web-mode ace-window company-lsp company-racer flycheck flycheck-rust racer cargo rust-mode ac-haskell-process company-ghci company lsp-haskell lsp-mode lsp-ui haskell-mode gruber-darker-theme smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs_saves")))
