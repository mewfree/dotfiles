;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

(doom! :completion
       (company +childframe)           ; the ultimate code completion backend
       vertico

       :ui
       doom                            ; what makes DOOM look the way it does
       doom-dashboard                  ; a nifty splash screen for Emacs
       ;;(emoji +unicode)              ; 🙂
       hl-todo                         ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       indent-guides                   ; highlighted indent columns
       modeline                        ; snazzy, Atom-inspired modeline, plus API
       ophints                         ; highlight the region an operation acts on
       (popup +defaults)               ; tame sudden yet inevitable temporary windows
       ;;(treemacs +lsp)                 ; a project drawer, like neotree but cooler
       ;;unicode                       ; extended unicode support for various languages
       (vc-gutter +diff-hl +pretty)    ; vcs diff in the fringe
       vi-tilde-fringe                 ; fringe tildes to mark beyond EOB
       workspaces                      ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere)              ; come to the dark side, we have cookies
       fold                            ; (nigh) universal code folding
       (format +onsave)                ; automated prettiness
       multiple-cursors                ; editing in many places at once
       ;;parinfer                      ; turn lisp into python, sort of
       rotate-text                     ; cycle region at point between text candidates
       snippets                        ; my elves. They type so I don't have to
       word-wrap

       :emacs
       (dired +icons)                  ; making dired pretty [functional]
       ;;electric                      ; smarter, keyword-based electric-indent
       (ibuffer +icons)                ; interactive buffer management
       (undo +tree)                    ; persistent, smarter undo for your inevitable mistakes
       ;;vc                            ; version-control and Emacs, sitting in a tree

       :term
       eshell                          ; the elisp shell that works everywhere
       vterm                           ; the best terminal emulation in Emacs

       :checkers
       (syntax +childframe)            ; tasing you for every semicolon you forget
       spell                           ; tasing you for misspelling mispelling
       ;;grammar                       ; tasing grammar mistake every you make

       :tools
       (debugger +lsp)
       direnv
       ;;(docker +lsp)
       (eval +overlay)                 ; run code, run (also, repls)
       (lookup +dictionary)            ; navigate your code and its documentation
       lsp
       magit                           ; a git porcelain for Emacs
       ;;make                          ; run make tasks from Emacs
       pdf                             ; pdf enhancements
       ;;prodigy                       ; managing external services & code builders
       tree-sitter

       :os
       (:if IS-MAC macos)              ; improve compatibility with macOS
       tty                             ; improve the terminal Emacs experience

       :lang
       ;;(cc +lsp +tree-sitter)        ; C/C++/Obj-C madness
       (clojure +lsp)                  ; java with a lisp
       ;;common-lisp                   ; if you've seen one lisp, you've seen them all
       crystal                         ; ruby at the speed of c
       data                            ; config/data formats
       (dart +flutter +lsp)            ; paint ui and not much else
       (elixir +lsp +tree-sitter)      ; erlang done right
       ;;(elm +lsp +tree-sitter)       ; care for a cup of TEA?
       emacs-lisp                      ; drown in parentheses
       ;;erlang                        ; an elegant language for a more civilized age
       (fsharp +lsp)                   ; ML stands for Microsoft's Language
       (go +lsp +tree-sitter)          ; the hipster dialect
       (haskell +lsp)                  ; a language that's lazier than I am
       (json +lsp +tree-sitter)        ; At least it ain't XML
       (javascript +lsp +tree-sitter)  ; all(hope(abandon(ye(who(enter(here))))))
       (julia +lsp +tree-sitter)       ; a better, faster MATLAB
       (kotlin +lsp)                   ; a better, slicker Java(Script)
       (latex +lsp)                    ; writing papers in Emacs has never been so fun
       ;;ledger                        ; an accounting system in Emacs
       (lua +lsp)                      ; one-based indices? one-based indices
       (markdown +grip)                ; writing docs for people to ignore
       nim                             ; python + lisp at the speed of c
       ;;nix                           ; I hereby declare "nix geht mehr!"
       (ocaml +lsp)                    ; an objective camel
       (org +journal +gnuplot)         ; organize your plain life in plain text
       plantuml                        ; diagrams for confusing people more
       (python +lsp +tree-sitter)      ; beautiful is better than ugly
       (racket +lsp)                   ; a DSL for DSLs
       ;;raku                          ; the artist formerly known as perl6
       rest                            ; Emacs as a REST client
       (ruby +rails +lsp +tree-sitter) ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp)                     ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (scala +lsp +tree-sitter)       ; java, but good
       (scheme +guile +racket)         ; a fully conniving family of lisps
       (sh +lsp)                       ; she sells {ba,z,fi}sh shells on the C xor
       solidity                        ; do you need a blockchain? No.
       (web +lsp +tree-sitter)         ; the tubes
       (yaml +lsp)                     ; JSON, but readable
       (zig +lsp)
       (beancount +lsp)

       :app
       calendar

       :config
       ;;literate
       (default +bindings +smartparens))
