





(use-package indent-bars
  :disabled
  :straight '(indent-bars :type git
			  :host github
			  :repo "jdtsmith/indent-bars")
  :config
  (setq indent-bars-color '(highlight :face-bg t :blend 0.15)
	indent-bars-starting-column 0
	indent-bars-pattern "."
	indent-bars-width-frac 0.1
	indent-bars-pad-frac 0.1
	indent-bars-zigzag nil
	indent-bars-color-by-depth '(:regexp "outline-\\([0-9]+\\)" :blend 1) ; blend=1: blend with BG only
	indent-bars-highlight-current-depth '(:blend 0.5) ; pump up the BG blend on current
	indent-bars-display-on-blank-lines t)

  :custom
  (indent-bars-prefer-character t)
  :hook (prog-mode . indent-bars-mode))




(use-package whitespace
  :demand
  :config
  (setq whitespace-style '(indentation)
        whitespace-display-mappings '((tab-mark 9 [8250 9])
                                      (newline-mark 10 [172 10])
                                      (space-mark 32 [8226] [46]))
	indent-tabs-mode nil)
  :hook (prog-mode . whitespace-mode))

(provide 'implicit-indent)
