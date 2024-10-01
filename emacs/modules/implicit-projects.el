(use-package exec-path-from-shell
  :demand
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))



(use-package projectile
  :config
  (projectile-mode +1)
  :general
  (+leader-keys
    ;; "p" '("Projectile map" . projectile-command-map)
    "p !" '("Run cmd in project root"     . projectile-run-shell-command-in-root)
    "p &" '("Async cmd in project root"   . projectile-run-async-shell-command-in-root)
    "p ." '("Browse project"              . projectile-find-file)
    "p >" '("Browse other project"        . projectile-find-other-file)
    "p a" '("Add new project"             . projectile-add-known-project)
    "p b" '("Switch to project buffer"    . projectile-switch-to-buffer)
    "p c" '("Compile in project"          . projectile-compile-project)
    "p C" '("Repeat last command"         . projectile-repeat-last-command)
    "p d" '("Remove known project"        . projectile-remove-known-project)
    "p D" '("Discover projects in folder" . projectile-discover-projects-in-directory)
    "p e" '("Edit project's .dir-locals"  . projectile-edit-dir-locals)
    "p f" '("Find file in project"        . projectile-find-file)
    "p F" '("Find file in other project"  . projectile-find-other-file)
    "p g" '("Configure project"           . projectile-configure-project)
    "p i" '("Invalidate project cache"    . projectile-invalidate-cache)
    "p k" '("Kill project buffers"        . projectile-kill-buffers)
    "p o" '("Find sibling file"           . projectile-find-related-file)
    "p p" '("Switch project"              . projectile-switch-project)
    "p r" '("Find recent project files"   . projectile-recentf-files)
    "p R" '("Run project"                 . projectile-run-project)
    "p s" '("Save project files"          . projectile-save-project-buffers)
    "p t" '("List project todos"          . magit-todos-list)
    "p T" '("Test project"                . projectile-test-project))
  ("C-c p" '("Projectile commands" . projectile-command-map)))


(provide 'implicit-projects)
