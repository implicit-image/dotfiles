

;;; Code
(("doom" . ((user-emacs-directory . "~/.emacs.doom.d")
            (env . (("DOOMDIR" . "~/.doom.d")))
            (server-name . "doom")
            (straight-p . 1)))
 ("light" . ((user-emacs-directory . "~/.emacs.light.d")
             (env . (("DOOMDIR" . "~/.doom.light.d")))
             (server-name . "light")
             (straight-p . 1)))

 ("vanilla" . ((user-emacs-directory . "~/.emacs.vanilla.d")
               (server-name . "light")
               (straight-p . 1)))
 ("custom" . ((user-emacs-directory . "~/.emacs.custom.d")
              (custom-file . "~/.emacs.custom.d/custom.el")
              (server-name . "custom")
              (straight-p . 1))))
