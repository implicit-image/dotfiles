
;; global keybindings

(+leader-keys
  ":" '("Execute command"                . counsel-M-x)
  "." '("Find file in cwd"               . counsel-find-file)
  "*" '("Find thing-at-point in project" . +search/rg-thing-at-point)
  "f P" '("Browse modules"               . +modules/browse)
  "SPC" '("Find file in project"         . projectile-find-file)
  "/" '("Search project"                 . counsel-rg)
  "`" '("Last buffer"                    . evil-switch-to-windows-last-buffer)
  ;; dummy entries for which-key labels
  "a" '(:ignore t :which-key "applications")
  "b" '(:ignore t :which-key "buffer")
  "c" '(:ignore t :which-key "code")
  "d" '(:ignore t :which-key "dired")
  "f" '(:ignore t :which-key "find")
  "g" '(:ignore t :which-key "git")
  "s" '(:ignore t :which-key "search")
  "h" '(:ignore t :which-key "help")
  "t" '(:ignore t :which-key "toggle")
  "t v" '("Visual line mode" . visual-line-mode)
  "o" '(:ignore t :which-key "open")
  "o x" '("Scratch buffer" . scratch-buffer)
  "n" '(:ignore t :which-key "notes")
  "p" '(:ignore t :which-key "projects")
)

(use-package hydra)

(use-package which-key
  :demand
  :commands
  (which-key-setup-side-window-bottom)
  :init
  (setq which-key-popup-type 'minibuffer
        which-key-idle-delay 0.6
	which-key-max-display-columns 5
	which-key-add-column-padding 10)
  (which-key-setup-side-window-bottom)
  :config
  (which-key-mode))

(provide 'implicit-keybindings)
