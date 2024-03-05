
(setq user-full-name "Błażej Niewiadomski"
      user-mail-address "blaz.nie@protonmail.com")

(setq doom-font (font-spec :family "Iosevka" :size 30)
      doom-variable-pitch-font (font-spec :family "sans" :size 24))

(load-theme 'gruber-darker t)

(require 'whitespace)
(require 'color)
(require 'org)
(require 'olivetti)

(set-face-foreground 'font-lock-comment-face "#8b8b83")
(set-face-foreground 'font-lock-comment-delimiter-face "#8b8b83")
(set-face-attribute 'whitespace-space nil :background nil :foreground "#777777")


(use-package! gdscript-mode
  :config (setq gdscript-godot-executable "godot4"))

(use-package! ox-extra
  :config
  (ox-extras-activate '(latex-header-blocks ignore-headlines)))

(use-package! ox-latex
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
    (setq org-latex-classes nil)))

(use-package! org
  :config
  (setq org-hide-emphasis-markers 1
      org-directory "~/org/"
      org-hide-macro-markers 1
      org-confirm-babel-evaluate nil
      org-md-headline-style 'setext))


(after! org
   (map!
        :map org-mode-map
        :leader
         :prefix "m"
         :desc "Render LaTeX blocks" "R" #'org-latex-preview)
     (org-bullets-mode 1)
     (visual-line-mode 1)
     (whitespace-mode -1)
     ;;fix the look of babel blocks
     (set-face-attribute 'whitespace-space nil :background nil :foreground "#777777")
     (set-face-attribute 'org-block nil :background "#181818")
     (set-face-attribute 'org-block-begin-line nil
                        :background (color-darken-name (face-attribute 'default :background) 30))
     (set-face-attribute 'org-block-end-line nil :background
                        (color-darken-name
                         (face-attribute 'default :background) 30)))


(require 'dashboard)
(dashboard-setup-startup-hook)

(use-package! dashboard
  :config
  (setq dashboard-startup-banner 2
        dashboard-set-file-icons t
        dashboard-set-heading-icons t
        dashboard-set-navigator t
        dashboard-items '((recents . 5) (agenda . 5))))

;; (use-package! highlight-indent-guides
;;   :config
;;   (setq highlight-indent-guides-method 'bitmap
;;         highlight-indent-guides-bitmap-function #'highlight-indent-guides--bitmap-line
;;         highlight-indent-guides-responsive 'stack
;;         highlight-indent-guides-auto-character-face-perc 200))

(setq display-line-numbers-type 'relative
      make-backup-files nil
      evil-want-fine-undo t
      auto-save-default t
      doom-modeline-buffer-file-name-style 'buffer-name
      whitespace-style '(face tabs spaces indentation space-mark tab-mark)
      initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))
      )


(add-hook! 'prog-mode-hook #'whitespace-mode)
(add-hook! 'prog-mode-hook #'rainbow-delimiters-mode-enable)
(add-hook! 'gdscript-mode-hook #'lsp)

(use-package! dired
  :config
  (setq
   dired-omit-mode 0
   dired-auto-revert-buffer t
   dired-dwim-target t))

(require 'lsp-mode)
(use-package! lsp-mode
:config (setq lsp-enable-symbol-highlighting t
               lsp-ui-sideline-show-code-actions nil
               lsp-ui-doc-enable t
               lsp-ui-peek-enable t
               lsp-ui-doc-alignment 'frame
               lsp-ui-doc-include-signature t
               lsp-ui-doc-delay 0.1
               lsp-modeline-code-actions-enable t
               lrp-modeline-diagnostics-enable t
               lsp-signature-auto-activate t
               lsp-completion-show-detail t
               lsp-completion-show-kind t
               lsp-lens-enable nil
               ))
  ;; bind lsp-ui-doc-show or ls)


;;org-mode
(setq org-odt-preffered-output-format "doc")
(setq org-directory "~/org/")

(use-package! twittering-mode
  :config (setq twittering-cert-file "/etc/ssl/certs/ca-bundle.crt"
                twittering-connection-type-order '(wget curl urllib-http native urllib-https)))


(add-to-list 'recentf-exclude "\\.priv\\'")
(add-to-list 'org-src-lang-modes (cons "jsx" 'rjsx))

(use-package! company
  :config
  (setq company-idle-delay nil
        company-selection-wrap-around t
        company-show-quick-access t
        company-tng-mode t
        ))


(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(add-to-list 'auto-mode-alist '("\\.rasi\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.nss\\'" . c-mode))

(use-package! lsp-haskell
 :hook haskell-mode-hook)

(use-package! haskell-mode
  :config (setq haskell-doc-use-inf-haskell 1
                haskell-interactive-popup-errors nil))


(use-package! rustic
  :config (setq rustic-lsp-server 'rust-analyzer
                rustic-lsp-client 'lsp-mode ))

(use-package! org-noter
  :config (setq org-noter-notes-window-location 'horizontal-split
                org-noter-always-create-frame nil
                org-noter-notes-search-path '("~/org/booknotes/")
                org-noter-default-heading-title "PAGE $p$"))

(use-package! ivy
  :config (setq ivy-height 10))



;; (use-package! lsp-tailwindcss
;;   :config (setq! lsp-tailwindcss-add-on-mode t))

;; editor config
(setq standard-indent 4
      ;;typescript
      typescript-indent-level 4
      ;;web
      web-mode-code-indent-offset 4
      web-mode-markup-indent-offset 4
      ;;C
      c-basic-offset 4
      ;;js
      js2-indent-level 4)


(setq calibredb-root-dir "~/Library"
      calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir)
      calibredb-library-alist '(("~/Library")))


(setq +latex-viewers '(pdf-tools))

;; KEYBINDINGS
;;      EXAMPLES
;;      (map! :map magit-mode-map
;;            :m  "C-r" 'do-something           ; C-r in motion state
;;            :nv "q" 'magit-mode-quit-window   ; q in normal+visual states
;;            "C-x C-r" 'a-global-keybind
;;            :g "C-x C-r" 'another-global-keybind  ; same as above

;;            (:when (featurep :system 'macos)
;;              :n "M-s" 'some-fn
;;              :i "M-o" (cmd! (message "Hi"))))

;;      (map! (:when (modulep! :completion company) ; Conditional loading
;;              :i "C-@" #'+company/complete
;;              (:prefix "C-x"                       ; Use a prefix key
;;                :i "C-l" #'+company/whole-lines)))

;;      (map! (:when (modulep! :lang latex)    ; local conditional
;;              (:map LaTeX-mode-map
;;                :localleader                  ; Use local leader
;;                :desc "View" "v" #'TeX-view)) ; Add which-key description
;;            :leader                           ; Use leader key from now on
;;            :desc "Eval expression" ";" #'eval-expression)

(map! :leader
      (:prefix ("a" . "applications")
       (:desc "Open calibredb" "c" #'calibredb
        :desc "Counsel Web Colors" "C" #'counsel-colors-web))
      (:prefix ("t" . "toggle")
       :desc "Visual line mode" "v" #'visual-line-mode)
      (:prefix ("t" . "toggle")
       :desc "Modeline" "M" #'global-hide-mode-line-mode))
