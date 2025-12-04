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
(package! ob-kotlin)
(package! nyan-mode)
(package! chatgpt-shell
  :recipe (:host github :repo "xenodium/chatgpt-shell"))
(package! acp :recipe (:host github :repo "xenodium/acp.el"))
(package! agent-shell :recipe (:host github :repo "xenodium/agent-shell"))
(package! literate-calc-mode)
(package! copilot
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))
(package! copilot-chat
  :recipe (:host github :repo "chep/copilot-chat.el" :files ("*.el")))
