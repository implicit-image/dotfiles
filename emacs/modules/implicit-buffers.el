
(defun +buffers/decide-ibuffer-filters ()
  (let ((group (symbol-name 'default)))
    (ibuffer-switch-to-saved-filter-groups group)))

(use-package ibuffer
  :straight nil
  :init
  (setq ibuffer-show-empty-filter-groups nil)
  :hook (ibuffer-mode . #'+buffers/decide-ibuffer-filters)
  :general
  ("C-x k" 'kill-this-buffer)
  (+leader-keys
    "b i" '("Open ibuffer"     . ibuffer)
    "b b" '("Find buffer"      . counsel-switch-buffer)
    "b K" '("Kill this buffer" . kill-this-buffer)
    "b k" '("Kill buffer"      . kill-buffer)))


(use-package ibuffer-projectile)

(use-package ibuffer-vc
  :after ibuffer
  :config
  (ibuffer-vc-set-filter-groups-by-vc-root))


(use-package recentf
  :straight t
  :demand
  :config
  (recentf-mode 1)
  :general
  (+leader-keys
    "f r" '("Recent files" . counsel-recentf)))


(+leader-keys
  "b p" '("Popup buffer" . popwin:popup-buffer))



(provide 'implicit-buffers)
