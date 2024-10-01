

(use-package telephone-line
  :disabled
  :demand
  :init
  (setq telephone-line-primary-right-separator 'telephone-line-nil
	telephone-line-secondary-right-separator 'telephone-line-nil
	telephone-line-primary-left-separator 'telephone-line-nil
	telephone-line-secondary-left-separator 'telephone-line-nil)
  (setq telephone-line-lhs
	'((evil   . (telephone-line-evil-tag-segment))
	  (nil .    (telephone-line-projectile-buffer-segment))
	  (accent . (telephone-line-vc-segment
		     telephone-line-process-segment))))
  (setq telephone-line-rhs
	'((accent . (telephone-line-airline-position-segment))
	  (modal . (telephone-line-major-mode-segment))))
  :config
  (telephone-line-mode 1))


;; display search candidate count on modeline
(use-package anzu
  :demand
  :after doom-modeline)

(use-package evil-anzu
  :after anzu
  :config (global-anzu-mode +1))


;; the modeline
(use-package doom-modeline
  :demand
  :init
  (setq doom-modeline-buffer-file-name-style 'truncate-nil
        doom-modeline-minor-modes nil
	doom-modeline-height 25
	doom-modeline-project-detection 'auto)
  :config
  (doom-modeline-mode 1))
  


(provide 'implicit-modeline)

