(setq inhibit-startup-screen t)
(setq visible-bell 1)


(tool-bar-mode 0)
(ido-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;(add-hook 'after-init-hook 'global-company-mode)

;;--smex---------------------------------------------------------------------
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;--haskell mode--------------------------------------------------------------
(require 'lsp)
(require 'lsp-mode)
(require 'lsp-haskell)

(setq haskell-process-log t)
(setq haskell-process-type "stack-ghci")

;;(define-key haskell-mode-map (kbd "<f5>") 'haskell-navigate-imports)
;;(define-key haskell-mode-map (kbd "<f8>") 'haskell-mode-format-imports)

;;hooks
;;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-mode-hook 'lsp-mode)
(add-hook 'haskell-mode-hook 'company-mode)


;;--rust----------------------------------------------------
(require 'lsp-mode)
(setq lsp-rust-server 'rust-analyzer)
(add-hook 'rust-mode-hook 'lsp-mode)
(add-hook 'rust-mode-hook 'company-mode)

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;
(setq company-tooltip-align-annotations t)
(global-set-key (kbd "M-p") 'ace-window)
(global-display-line-numbers-mode 1)


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
   '(tide js2-mode web-mode ace-window company-lsp company-racer flycheck flycheck-rust racer cargo rust-mode ac-haskell-process company-ghci company lsp-haskell lsp-mode lsp-ui haskell-mode gruber-darker-theme smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq backup-directory-alist '(("." . "~/.emacs_saves")))


