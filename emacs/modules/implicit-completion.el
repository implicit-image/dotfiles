
(use-package ivy
  :init
  (setq ivy-height 10)
  :config
  ;; override default initial input
  (ivy-configure 'counsel-M-x
    :initial-input "")
  (ivy-mode)
  (setq ivy-use-virtual-buffers t
	enable-recursive-minibuffers t)
  :hook (after-init . ivy-mode))

(use-package counsel
  :after evil
  :general
  ("M-x" '(lambda ()
	    (interactive)
	    (counsel-M-x "")))
  (+leader-keys
    "h m" '("Describe keymap"   . describe-keymap)
    "h p" '("Describe package"  . describe-package)
    "h F" '("Describe face"     . counsel-faces)
    "h t" '("Describe font"     . describe-font)
    "h b" '("Describe bindings" . describe-bindings)
    "h M" '("Describe mode"     . describe-mode)
    "h s" '("Describe symbol"   . counsel-describe-symbol)
    "h t" '("Load theme"        . counsel-load-theme)
    "h l" '("Load library"      . counsel-load-library)))
  
(use-package swiper
  :after evil
  :general
  (+leader-keys
    "s b" '("Swiper" . swiper)))

(use-package marginalia
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;; Embark + consult + vertico stack
;; disabled for now
;; NOTE: maybe replace ivy+counsel in the future
(use-package embark
  :disabled
  :bind
  (("C-."   . embark-act)         ;; pick some comfortable binding
   ("C-;"   . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))


(use-package consult
  :disabled)

(use-package vertico
  :disabled
  :custom
  (vertico-count 13)                    ; Number of candidates to display
  (vertico-resize t)
  (vertico-cycle nil) ; Go from last to first candidate and first to last (cycle)?
  :general
  (:keymaps 'vertico-map
   "<tab>" #'vertico-insert  ; Insert selected candidate into text area
   "<escape>" #'minibuffer-keyboard-quit ; Close minibuffer
   "C-M-n" #'vertico-next-group
   "C-M-p" #'vertico-previous-group)
  :config
  (vertico-mode))


(use-package embark-consult
  :disabled
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


;; in-buffer completion
(use-package corfu
  :demand
  :init
  (setq corfu-cycle t
	corfu-doc-delay 0.00
	corfu-popupinfo-delay '(0.4 . 0.2)
	corfu-left-margin-width 1
	corfu-right-margin-width 1
	corfu-bar-width 0
	corfu-count 15)
  :custom-face
  (corfu-border ((t (:background ,(face-attribute 'font-lock-keyword-face :background nil 'default)))))
  ;; (corfu-indexed ((t (:font ,+base/font-spec))))
  :config
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  ;; (set-face-attribute 'corfu-border nil :background "#ffdd33")
  ;; (set-face-attribute 'corfu-indexed nil :font +base/font-spec)
  :general
  ("C-SPC" 'completion-at-point)
  (corfu-mode-map
   "C-h" 'corfu-doc-toggle
   "C-d" 'evil-lookup-func))

;; for corfu terminal support
(use-package corfu-terminal)

(use-package corfu-doc-terminal
  :straight '(corfu-doc-terminal
	      :type git
	      :repo "https://codeberg.org/akib/emacs-corfu-doc-terminal.git"))


(use-package corfu-candidate-overlay
  :demand
  :config
  (set-face-attribute 'corfu-candidate-overlay-face nil :inherit font-lock-comment-face)
  (corfu-candidate-overlay-mode 1))

(use-package cape
  :after corfu
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file))

(use-package yasnippet-capf
  :after cape
  :config
  (add-hook 'completion-at-point-functions #'yasnippet-capf))

(use-package tempel
  :after corfu
  :init
  (add-hook 'completion-at-point-functions #'tempel-expand))

(use-package tempel-collection
  :after tempel)



(provide 'implicit-completion)

