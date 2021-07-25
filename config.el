

;; name and email
(setq user-full-name "Błażej Niewiadomski"
      user-mail-address "blaz.nie@protonmail.com")


;;font
(setq doom-font (font-spec :family "Code New Roman Nerd Font Mono" :size 20)
       doom-variable-pitch-font (font-spec :family "sans" :size 16))

;;theme
(load-theme 'doom-tomorrow-night t)


;;editor
(setq display-line-numbers-type 'relative)
(+global-word-wrap-mode +1)


(setq
  evil-want-fine-undo t
  auto-save-default t)
(display-time-mode 1)
(display-battery-mode 1)




;;languages & configs


;;js2
(setq js2-indent-level 2)

;;org-mode
(setq org-odt-preffered-output-format "doc")
(setq org-directory "~/org/")

;;calibredb

(setq calibredb-root-dir "~/Calibre Library")
(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
(setq calibredb-library-alist '(("~/Calibre Library")))

;;pdf-view
