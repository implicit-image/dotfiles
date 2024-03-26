

;;; doom-gruber-darker-theme.el --- Port of gruber-draker theme to Doom themes -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: March 19, 2024 (4c981f2cccf3)
;; Author: Błażej Niewiadomski <https://github.com/implicit-image>
;; Maintainer:
;; Source: https://github.com/implicit-image/doom-gruber-darker
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-gruber-darker-theme nil
  "Options for the `doom-gruber-darker' theme."
  :group 'doom-themes)

(defcustom doom-gruber-darker-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-gruber-darker-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-gruber-darker
  "A theme based on Alexey Kutepov's Gruber Darker theme."
   ;; (gruber-darker-fg        '("#e4e4ef"))
   ;; (gruber-darker-fg+1      '("#f4f4ff"))
   ;; (gruber-darker-fg+2      '("#f5f5f5"))
   ;; (gruber-darker-white     '("#ffffff"))
   ;; (gruber-darker-black     '("#000000"))
   ;; (gruber-darker-bg-1      '("#101010"))
   ;; (gruber-darker-bg        '("#181818"))
   ;; (gruber-darker-bg+1      '("#282828"))
   ;; (gruber-darker-bg+2      '("#453d41"))
   ;; (gruber-darker-bg+3      '("#484848"))
   ;; (gruber-darker-bg+4      '("#52494e"))
   ;; (gruber-darker-red-1     '("#c73c3f"))
   ;; (gruber-darker-red       '("#f43841"))
   ;; (gruber-darker-red+1     '("#ff4f58"))
   ;; (gruber-darker-green     '("#73c936"))
   ;; (gruber-darker-yellow    '("#ffdd33"))
   ;; (gruber-darker-gray      '("#8b8b83"))
   ;; (gruber-darker-quartz    '("#95a99f"))
   ;; (gruber-darker-niagara-2 '("#303540"))
   ;; (gruber-darker-niagara-1 '("#565f73"))
   ;; (gruber-darker-niagara   '("#96a6c8"))
   ;; (gruber-darker-wisteria  '("#9e95c7"))

  ;; name        gui       256       16
  ((bg         '("#181818" nil       nil          ))
   (bg-alt     '("#282828" nil       nil          ))
   (base0      '("#0d0d0d" "black"   "black"      ))
   (base1      '("#1b1b1b" "#1b1b1b"              ))
   (base2      '("#212122" "#1e1e1e"              ))
   (base3      '("#292b2b" "#292929" "brightblack"))
   (base4      '("#3f4040" "#3f3f3f" "brightblack"))
   (base5      '("#5c5e5e" "#525252" "brightblack"))
   (base6      '("#95a99f" "#6b6b6b" "brightblack"))
   (base7      '("#969896" "#979797" "brightblack"))
   (base8      '("#ffffff" "#ffffff" "white"      ))
   (fg         '("#f5f5f5"))
   (fg-alt     (doom-darken fg 0.4))
   (grey       '("#8b8b83"))
   (red        '("#f43841" "#ee6666" "red"))
   (orange     '("#de935f" "#dd9955" "brightred"))
   (yellow     '("#ffdd33" "#ffdd33" "yellow"))
   (green      '("#73c936" "#73c936" "green"))
   (blue       '("#81a2be" "#88aabb" "brightblue"))
   (dark-blue  '("#303540" "#41728e" "blue"))
   (teal       '("#81a2be")) ; FIXME replace with real teal
   (magenta    '("#96a6c8" "#c9b4cf" "magenta"))
   (violet     '("#95a8af" "#b294bb" "brightmagenta"))
   (cyan       '("#565f73" "#8abeb7" "cyan"))
   (dark-cyan  (doom-darken cyan 0.4))

   ;; face categories
   (highlight      base7)
   (vertical-bar   base0)
   (selection      `(,(car (doom-lighten bg 0.1)) ,@(cdr base4)))
   (builtin        yellow)
   (comments       grey)
   (doc-comments   (doom-lighten grey 0.14))
   (constants      base6)
   (functions      magenta)
   (keywords       yellow)
   (methods        base7)
   (operators      yellow)
   (type           base6)
   (strings        green)
   (variables      fg)
   (numbers        base6)
   (region         selection)
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    fg-alt)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (modeline-bg     `(,(doom-darken (car bg-alt) 0.3) ,@(cdr base3)))
   (modeline-bg-alt `(,(car bg) ,@(cdr base1)))
   (modeline-fg     base8)
   (modeline-fg-alt comments)
   (-modeline-pad
    (when doom-gruber-darker-padded-modeline
      (if (integerp doom-gruber-darker-padded-modeline)
          doom-gruber-darker-padded-modeline
        4))))

  ;; --- faces ------------------------------
  (
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-alt :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))

   ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground (doom-lighten cyan .20))
   (rainbow-delimiters-depth-2-face :foreground magenta)
   (rainbow-delimiters-depth-3-face :foreground base7)
   (rainbow-delimiters-depth-4-face :foreground grey)
   (rainbow-delimiters-depth-5-face :foreground blue)
   (rainbow-delimiters-depth-6-face :foreground base6)
   (rainbow-delimiters-depth-7-face :foreground teal)
   ;;;; doom-modeline
   (doom-modeline-buffer-path       :foreground violet :bold bold)
   (doom-modeline-buffer-major-mode :inherit 'doom-modeline-buffer-path)
   ;;;; keywords
   (font-lock-keyword-face :foreground yellow :bold bold)
   (font-lock-number-face :foreground base6 :weight 'extra-light)

  ;;;; line numbers
   (line-number-current-line :foreground yellow :bold bold))
  ;; --- variables --------------------------
  ;; ()
  )

;;; doom-gruber-darker-theme.el ends here
