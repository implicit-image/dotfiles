

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


;; modeline
;; (add-to-list global-mode-string (shell-command-to-string "df -h --output=avail /dev/sda6 | grep G") )

;; ;
;languages & configs

;; haskell




;;js2
(setq js2-indent-level 2)

;;org-mode
(setq org-odt-preffered-output-format "doc")
(setq org-directory "~/org/")


(after! org
  (use-package! ox-extra
    :config
    (ox-extras-activate '(latex-header-blocks ignore-headlines))))


(after! org
  ;; Import ox-latex to get org-latex-classes and other funcitonality
  ;; for exporting to LaTeX from org
  (use-package! ox-latex
    :init
    ;; code here will run immediately
    :config
    ;; code here will run after the package is loaded
    (setq org-latex-pdf-process
          '("pdflatex -interaction nonstopmode -output-directory %o %f"
            "bibtex %b"
            "pdflatex -interaction nonstopmode -output-directory %o %f"
            "pdflatex -interaction nonstopmode -output-directory %o %f"))
    (setq org-latex-with-hyperref nil) ;; stop org adding hypersetup{author..} to latex export
    ;; (setq org-latex-prefer-user-labels t)

    ;; deleted unwanted file extensions after latexMK
    (setq org-latex-logfiles-extensions
          (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "xmpi" "run.xml" "bcf" "acn" "acr" "alg" "glg" "gls" "ist")))

    (unless (boundp 'org-latex-classes)
      (setq org-latex-classes nil))))

;;markdown

(setq markdown-css-paths `(, (expand-file-name "Documents/markdown.css")))


;;calibredb

(setq calibredb-root-dir "~/Library")
(setq calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir))
(setq calibredb-library-alist '(("~/Library")))

;;pdf-view

(setq +latex-viewers '(pdf-tools))

;;epub
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
;;irc

(set-irc-server! "irc.twitch.tv"
                 '(:tls t
                   :port 6697
                   :nick "unexpectednick"
                   :sasl-password (getenv "TWITCH_TOKEN")
                   :channels ("#miamulder")))

;; (map!  )

(provide 'config)
