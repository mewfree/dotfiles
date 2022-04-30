;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! org-super-agenda)
(package! org-fancy-priorities)
(package! ob-julia-vterm)
(package! ob-elixir)
(package! ob-fsharp)
(package! ob-typescript)
(package! ob-zig
  :recipe (:host github :repo "jolby/ob-zig.el"))
(package! gleam-mode
  :recipe (:host github :repo "gleam-lang/gleam-mode"))
(package! org-fragtog)
(package! lsp-tailwindcss
  :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! futhark-mode)
(package! ob-mermaid)
(package! org-autolink
  :recipe (:local-repo "~/dev/org-autolink"))
