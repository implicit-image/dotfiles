
(use-package emacs
  :init
  (setq window-divider-default-places t
	window-divider-default-right-width 2
	window-divider-default-bottom-width 2)
  :custom-face
  (window-divider ((t (:background "#a1a1a1" :foreground "#a1a1a1")))))

(use-package ace-window
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (global-set-key [remap evil-window-next] #'ace-window)
  :general
  (+leader-keys
    "w w" '("Popup-window" . ace-window)))

(use-package popwin
  :demand
  :config
  (push '("\*Warnings\**"
	  :regexp t
	  :height 0.25
	  :position bottom
	  :dedicated nil) popwin:special-display-config)
  (push '("\*scratch\*"
	  :regexp t
	  :width 0.4
	  :position bottom
	  :dedicated t) popwin:special-display-config)
  (popwin-mode 1)
  :general
  (+leader-keys
    "w p" '("Popup window" . popwin:popup-window)))

(provide 'implicit-windows)


