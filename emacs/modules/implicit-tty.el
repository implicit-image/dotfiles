(setq visible-cursor nil)


(use-package kkp
  :demand
  :config
  (global-kkp-mode +1))


(use-package evil-terminal-cursor-changer
  :init
  (setq evil-motion-state-cursor 'box
	evil-visual-state-cursor 'box
	evil-normal-state-cursor 'box
	evil-insert-state-cursor 'bar
	evil-emacs-state-cursor  'hbar)
  :hook
  (tty-setup . evil-terminal-cursor-changer))


(add-hook 'tty-setup-hook #'xterm-mouse-mode)

(provide 'implicit-tty)
