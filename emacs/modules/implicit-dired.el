(use-package dired
  :straight nil
  :init
  (setq dired-dwim-target t)
  :general
  (dired-mode-map
   :states '(normal visual)
   "RET" 'dired-find-file
   "!"	 'dired-do-shell-command
   "#"	 'dired-flag-auto-save-files
   "$"	 'dired-hide-subdir
   "&"	 'dired-do-async-shell-command
   "("	 'dired-hide-details-mode
   "+"	 'dired-create-directory
   "."	 'dired-clean-directory
   "<"	 'dired-prev-dirline
   "="	 'dired-diff
   ">"	 'dired-next-dirline
   "?"   'dired-summary
   "A"	 'dired-do-find-regexp
   "B"	 'dired-do-byte-compile
   "C"   'dired-do-copy
   "D" 	 'dired-do-delete
   "G"	 'dired-do-chgrp
   "H"	 'dired-do-hardlink
   "I"	 'dired-do-info
   "L"	 'dired-do-load
   "M"	 'dired-do-chmod
   "N" 	 'dired-do-man
   "O"	 'dired-do-chown
   "P"	 'dired-do-print
   "Q"	 'dired-do-find-regexp-and-replace
   "R"	 'dired-do-rename
   "S"	 'dired-do-symlink
   "T"	 'dired-do-touch
   "U"	 'dired-unmark-all-marks
   "W"	 'browse-url-of-dired-file
   "X"	 'dired-do-shell-command
   "Y"	 'dired-do-relsymlink
   "Z"	 'dired-do-compress
   "^"	 'dired-up-directory
   "a"	 'dired-find-alternate-file
   "c"	 'dired-do-compress-to
   "d"	 'dired-flag-file-deletion
   "o"   'dired-do-redisplay
   "m"	 'dired-mark
   "j"	 'dired-next-line
   "k"	 'dired-previous-line
   "q"	 'quit-window
   "s"	 'dired-sort-toggle-or-edit
   "t"	 'dired-toggle-marks
   "u"	 'dired-unmark
   "v"	 'dired-view-file
   "w"	 'dired-copy-filename-as-kill
   "x"	 'dired-do-flagged-delete
   "i"	 'dired-show-file-type
   "-"   'dired-up-directory))


(provide 'implicit-dired)
