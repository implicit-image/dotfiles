
;; (load "./local.el")


(setq user-full-name "Błażej Niewiadomski"
      user-mail-address "blaz.nie@protonmail.com")

(setq doom-font (font-spec :family "Iosevka" :size 30)
      doom-variable-pitch-font (font-spec :family "sans" :size 24))

(load-theme 'gruber-darker t)

(require 'whitespace)
(require 'color)
(require 'org)


(set-face-foreground 'font-lock-comment-face "#8b8b83")
(set-face-foreground 'font-lock-comment-delimiter-face "#8b8b83")
(set-face-attribute 'whitespace-space nil :background nil :foreground "#777777")

(after! org
  (lambda () (org-bullets-mode 1))
  (visual-line-mode)
  (whitespace-mode -1)
  ;;fix the look of babel blocks
  (set-face-attribute 'whitespace-space nil :background nil :foreground "#777777")
  (set-face-attribute 'org-block nil :background "#181818")
  (set-face-attribute 'org-block-begin-line nil :background
                      (color-darken-name
                       (face-attribute 'default :background) 2))
  (set-face-attribute 'org-block-end-line nil :background
                      (color-darken-name
                       (face-attribute 'default :background) 2))
  (set-face-attribute 'org-block nil :foreground
                      (color-lighten-name
                       (face-attribute 'default :foreground) 2))
  (map! :desc "Evaluate babel source block" :niv "C-c C-s" #'org-babel-execute-src-block:async)
  (map! :leader
        :prefix "m"
        :desc "Render LaTeX blocks" "R" #'org-latex-preview))

(setq org-hide-emphasis-markers 1
      org-directory "~/org/"
      org-hide-macro-markers 1
      org-confirm-babel-evaluate nil
      org-md-headline-style 'setext)

(require 'dashboard)
(dashboard-setup-startup-hook)

(use-package! dashboard
  :config
  (setq dashboard-startup-banner 2
        dashboard-set-file-icons t
        dashboard-set-heading-icons t
        dashboard-set-navigator t))


(setq display-line-numbers-type 'relative
      make-backup-files nil
      evil-want-fine-undo t
      auto-save-default t
      doom-modeline-buffer-file-name-style 'buffer-name
      whitespace-style '(face tabs spaces indentation space-mark tab-mark)
      initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))
      )

;; (defun org-setup ()
;;   (interactive)
;;   (whitespace-mode -1))

(add-hook! 'prog-mode-hook #'whitespace-mode)
(add-hook! 'prog-mode-hook #'rainbow-delimiters-mode-enable)
;; (add-hook! 'org-mode-hook #'org-setup)
;; (display-time-mode 1)
;; (display-battery-mode 1)
;; (mini-modeline-mode)
;; (setq sml/theme 'dark)

(use-package! dired :config (setq dired-omit-mode 0))

(require 'lsp-mode)
(use-package! lsp-mode
  :config (setq lsp-enable-symbol-highlighting 1
                lsp-ui-sideline-show-code-actions nil
                lsp-ui-doc-enable 1
                lsp-ui-peek-enable 1
                lsp-ui-doc-alignment 'frame
                lsp-ui-doc-delay 0.1
                lsp-modeline-code-actions-enable 1
                lsp-modeline-diagnostics-enable 1
                lsp-signature-auto-activate 1
                lsp-signature-render-documentation 1
                lsp-completion-show-detail 1
                lsp-completion-show-kind 1
                ;;pyright
                lsp-pyright-diagnostic-mode "workspace"))
  ;; bind lsp-ui-doc-show or ls)

;;org-mode
(setq org-odt-preffered-output-format "doc")
(setq org-directory "~/org/")


(after! org
  (+word-wrap-mode 1)
  (use-package! ox-extra
    :config
    (ox-extras-activate '(latex-header-blocks ignore-headlines)))
  (use-package! ox-latex
    :init
    :config
    (setq org-latex-pdf-process
          '("pdflatex -interaction nonstopmode -output-directory %o %f"
            "bibtex %b"
            "pdflatex -interaction nonstopmode -output-directory %o %f"
            "pdflatex -interaction nonstopmode -output-directory %o %f"))
    (setq org-latex-with-hyperref nil) ;; stop org adding hypersetup{author..} to latex export
    (setq org-latex-prefer-user-labels t)

    (setq org-latex-logfiles-extensions
          (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "xmpi" "run.xml" "bcf" "acn" "acr" "alg" "glg" "gls" "ist")))

    (unless (boundp 'org-latex-classes)
      (setq org-latex-classes nil))))

(add-to-list 'org-src-lang-modes (cons "jsx" 'rjsx))

(use-package! company
  :config
  (setq company-idle-delay nil
        company-selection-wrap-around 1
        company-show-quick-access 1
        company-tng-mode 1
        ))


(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(add-to-list 'auto-mode-alist '("\\.rasi\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.nss\\'" . zig-mode))

(use-package! lsp-haskell
  :hook haskell-mode-hook)

(use-package! haskell-mode
  :config (setq haskell-doc-use-inf-haskell 1
                haskell-interactive-popup-errors nil)
  )


(use-package! rustic
  :config (setq rustic-lsp-server 'rust-analyzer
                rustic-lsp-client 'lsp-mode))




;; editor config
(setq standard-indent 2
      ;;typescript
      typescript-indent-level 2
      ;;web
      web-mode-code-indent-offset 2
      web-mode-markup-indent-offset 2
      ;;C
      c-basic-offset 2
      ;;js
      js2-indent-level 2)


(setq calibredb-root-dir "~/Library"
      calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir)
      calibredb-library-alist '(("~/Library")))


(setq +latex-viewers '(pdf-tools))


;; KEYBINDINGS


(map! :leader
      (:prefix ("a" . "applications")
       :desc "Open calibredb" "c" #'calibredb))

(map! :leader
     (:prefix ("t" . "toggle")
      :desc "Visual line mode" "v" #'visual-line-mode))

(map! :leader
     (:prefix ("t" . "toggle")
       :desc "Modeline" "M" #'global-hide-mode-line-mode))
