                                        ;export TERM=xterm-256color
;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a "Module Index" link where you'll find
;;      a comprehensive list of Doom's modules and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).





(doom! :input
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       (company  )
                                        ; the ultimate code completion backend
       ;; (helm +fuzzy)              ; the *other* search engine for love and life
       ;; ido               ; the other *other* search engine...
       (ivy +prescient +icons)          ; a search engine for love and life
       ;; (corfu +icons +dabbrev)

       :ui
       deft                ; notational velocity for Emacs
       doom                ; what makes DOOM look the way it does
       ;;doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit                 ; DOOM quit-message prompts when you quit Emacs
       (emoji +unicode +github +ascii)  ; 🙂
       ;;fill-column       ; a `fill-column' indicator
       hl-todo                ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;hydra
       ;; indent-guides     ; highlighted indent columns
       ;;(ligatures +iosevka +extra)     ; ligatures and symbols to make your code pretty again
       ;; minimap           ; show a map of the code on the side
       (modeline) ; snazzy, Atom-inspired modeline, plus API
       ;;nav-flash         ; blink cursor line after big motions
       ;; neotree           ; a project drawer, like NERDTree for vim
       ophints                ; highlight the region an operation acts on
       (popup +defaults +all) ; tame sudden yet inevitable temporary windows
       ;;tabs              ; a tab bar for Emacs
       (treemacs +lsp)        ; a project drawer, like neotree but cooler
       unicode                ; extended unicode support for various languages
       vc-gutter              ; vcs diff in the fringe
       vi-tilde-fringe        ; fringe tildes to mark beyond EOB
       window-select          ; visually switch windows
       workspaces             ; tab emulation, persistence & separate workspaces
       zen                    ; distraction-free coding or writing


       :editor
       (evil +everywhere)               ; come to the dark side, we have cookies
       file-templates                   ; auto-snippets for empty files
       fold                             ; (nigh) universal code folding
       (format +onsave)                 ; automated prettiness
       ;;god               ; run Emacs commands without modifier keys
       lispy                ; vim for lisp, for people who don't like vim
       multiple-cursors     ; editing in many places at once
       (objed +manual)      ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       ;; rotate-text               ; cycle region at point between text candidates
       snippets
                                        ; my elves. They type so I don't have to
       word-wrap                 ; soft wrapping with language-aware indent

       :emacs
       (dired +icons)                   ; making dired pretty [functional]
       electric                         ; smarter, keyword-based electric-indent
       (ibuffer +icons)                 ; interactive buffer management
                                        ;
       :tramp
       (undo +tree)      ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       ;;eshell            ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs
       vterm                            ; the best terminal emulation in Emacs

       :checkers
       syntax        ; tasing you for every semicolon you forget
       ;;(spell +hunspell) ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       ;;ansible
       (debugger +lsp)       ; FIXME stepping through code, to help you add bugs
       direnv
       docker
       editorconfig     ; let someone else argue about tabs vs spaces
       ;; ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)       ; run code, run (also, repls)
       ;;gist              ; interacting with github gists
       (lookup +dictionary +offline +docsets) ; navigate your code and its documentation
       (lsp +peek)
       (magit +forge)                   ; a git porcelain for Emacs
       make                             ; run make tasks from Emacs
       (pass +auth)                     ; password manager for nerds
       pdf                              ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       ;; taskrunner        ; taskrunner for all your projects
       terraform          ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       upload                         ; map local to remote projects via ssh/ftp
       tree-sitter

       :os
       ;; (:if IS-MAC macos)
                                        ; improve compatibility with macOS
       (tty )                       ; improve the terminal Emacs experience

       :lang
       (agda +tree-sitter)              ; types of types of types of types...
       ;;beancount         ; mind the GAAP
       (cc +lsp +tree-sitter)           ; C > C++ == 1
       (clojure +lsp +tree-sitter)      ; java with a lisp
       common-lisp               ; if you've seen one lisp, you've seen them all
       coq                       ; proofs-as-programs
       crystal                   ; ruby at the speed of c
       (csharp +lsp +dotnet)     ; unity, .NET, and mono shenanigans
       data                      ; config/data formats
       (dart +flutter +lsp)      ; paint ui and not much else
       (elixir +lsp)             ; erlang done right
       (elm +lsp +tree-sitter)   ; care for a cup of TEA?
       emacs-lisp                ; drown in parentheses
       (erlang +lsp)             ; an elegant language for a more civilized age
       (ess +stan +tree-sitter)  ; emacs speaks statistics
       ;;factor
       ;;faust             ; dsp, but you get to keep your soul
       (fsharp +lsp)            ; ML stands for Microsoft's Language
       fstar                    ; (dependent) types and (monadic) effects and Z3
       (gdscript +lsp)          ; the language you waited for
       (go +tree-sitter +lsp)   ; the hipster dialect
       (haskell +tree-sitter +lsp)      ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       idris                       ; a language you can depend on
       (json +lsp)                 ; At least it ain't XML
       (java +lsp +tree-sitter)    ; the poster child for carpal tunnel syndrome
       (javascript +lsp +tree-sitter) ; all(hope(abandon(ye(who(enter(here))))))
       (julia +lsp)                   ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       (latex +latexmk +cdlatex +lsp +fold) ; writing papers in Emacs has never been so fun
       lean                                 ; for folks with too much to prove
       ;;ledger            ; be audit you can be
       (lua +lsp +tree-sitter)          ; one-based indices? one-based indices
       (markdown +grip)                 ; writing docs for people to ignore
       nim                              ; python + lisp at the speed of c
       (nix +tree-sitter)               ; I hereby declare "nix geht mehr!"
       (ocaml +lsp +tree-sitter)        ; an objective camel
       (org +jupyter +pretty +present +noter +journal +brain +gnuplot +dragndrop +roam2) ; organize your plain life in plain text
       (php +lsp +tree-sitter)          ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       (purescript +lsp)                ; javascript, but functional
       (python +lsp +pyright +poetry +tree-sitter +pyenv) ; beautiful is better than ugly
       qt               ; the 'cutest' gui framework ever
       (racket)         ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       (rest +jq)         ; Emacs as a REST client
       ;;rst               ; ReST in peace
       (ruby +rails +lsp) ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp +tree-sitter)      ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (scala +lsp +tree-sitter)     ; java, but good
       ;; (scheme +mit)   ; a fully conniving family of lisps
       (sh +lsp +tree-sitter +powershell) ; she sells {ba,z,fi}sh shells on the C xor
       ;;sml
       solidity             ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       (web +lsp +tree-sitter)          ; the tubes
       (yaml +lsp +tree-sitter)         ; JSON, but readable
       (zig +lsp +tree-sitter)          ; C, but simpler

       :email
       (mu4e +gmail)
       (notmuch +afew +org)
       ;;(wanderlust +gmail)

       :app
       calendar
       ;; emms
       ;; everywhere                       ; *leave* Emacs!? You must be joking
       irc
                                        ; how neckbeards socialize
       (rss +org)                       ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought

       :config
       literate
       (default +bindings +smartparens))
