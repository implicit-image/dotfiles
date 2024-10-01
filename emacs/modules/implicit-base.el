(require 'f)

(use-package emacs
  :demand
  :init
  (setq +base/font-family "Cascadia Code NF"
	+base/font-weight 'semi-light
	+base/font-size 20
	+base/font-spec (font-spec :family +base/font-family
				   :weight +base/font-weight
				   :size +base/font-size))
  ;; (set-frame-font +base/font-spec nil t)
  (add-to-list 'default-frame-alist '(font . "ComicShannsMono Nerd Font Mono-22"))
  (setq user-full-name "Błażej Niewiadomski"
        user-mail-address "blaz.nie@protonmail.com"
	;;startup
        inhibit-startup-screen t
        visible-bell nil
	;; lines
        display-line-numbers-type 'relative
	truncate-lines t
	truncate-partial-width-windows t
	;;tempfiles
        create-lockfiles nil
	backup-directory-alist `(("." . ,(f-join user-emacs-directory "backups/")))
	;; increase garbage collector limit
	gc-cons-threshold 100000000
	;; scrollling
	scroll-step 1)
  :config
  ;; always use short user input prompts
  (defalias 'yes-or-no-p 'y-or-n-p)
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (global-display-line-numbers-mode 1)
  (toggle-scroll-bar -1)
  (show-paren-mode 1)
  (electric-pair-mode 1)
  (global-hl-line-mode 1)
  (window-divider-mode 1)
  (add-to-list 'default-frame-alist
               '(vertical-scroll-bars . nil))
  ;; write customizations to seperate file
  (let ((customization-file
         (expand-file-name "custom.el" user-emacs-directory)))
    (unless (file-exists-p customization-file)
      (write-region "" nil customization-file))
    (setq custom-file customization-file)
    (load custom-file 'noerror))
  :hook
  (prog-mode . (lambda () (toggle-truncate-lines 1))))


(provide 'implicit-base)
