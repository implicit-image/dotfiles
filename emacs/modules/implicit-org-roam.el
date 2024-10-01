(require 'general)



(use-package org-roam
  :demand
  :custom
  (org-roam-directory (substitute-in-file-name "$HOME/org/roam"))
  (org-roam-dailies-directory "daily")
  (org-roam-dailies-capture-templates '(("d" "default" entry
					 "* %?"
					 :target (file+head "%<%Y-%m-%d>.org"
							    "#+title: %Y=%m-%d\n"))))
  :config
  (org-roam-db-autosync-mode)
  (require 'org-roam-protocol)
  (require 'org-roam-export)
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:20}" 'face 'org-tag))
        org-roam-db-node-include-function
        (lambda ()
          (not (member "ATTACH" (org-get-tags))))
        org-roam-db-update-on-save t
        org-roam-completion-everywhere t)
  :general
  (+leader-keys
   "n r" '(:ignore t :which-key "org roam")
   "n r f" '("Find Org Roam node" . org-roam-node-find)
   "n r r" '("Find random Org Roam node" . org-roam-node-random)
   "n r s" '("Sync Org Roam database" . org-roam-db-sync)
   "n r c" '("Org Roam capture" . org-roam-capture))
  (org-mode-map
   :states '(normal visual)
   :prefix "SPC n r"
   :global-prefix "M-SPC n r"
   "i" '("Insert Org Roam node" . org-roam-node-insert)))


(provide 'implicit-org-roam)
