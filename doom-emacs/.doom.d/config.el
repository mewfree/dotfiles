;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; global variables
(setq user-full-name "Damien Gonot"
      user-mail-address "damien.gonot@gmail.com"
      doom-theme 'doom-vibrant
      display-line-numbers-type 'relative
      projectile-project-search '("~/dev/")
      calendar-week-start-day 1
      display-time-24hr-format t
      dap-auto-configure-features '(locals expressions)
      evil-snipe-spillover-scope 'buffer
      lsp-zig-zls-executable "~/zls/zls"
      org-latex-create-formula-image-program 'dvisvgm)

(display-time-mode 1)

;; enable scrolling
(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

;; alias julia-vterm => julia
(defalias 'org-babel-execute:julia 'org-babel-execute:julia-vterm)
;; use my own LanguageServer.jl
(setq lsp-julia-package-dir nil)

;; easily add timestamps
(defun today () (interactive) (insert (format-time-string "%Y-%m-%d")))
(defun today-with-time () (interactive) (insert (format-time-string "%Y-%m-%d %H:%M")))
(defun timestamp () (interactive) (insert (format-time-string "%H:%M")))

;; open scratch if not open, close it if open
(defun toggle-scratch () (interactive)
       (if (get-buffer "*doom:scratch*")
           (kill-buffer (get-buffer "*doom:scratch*"))
           (doom/open-scratch-buffer)))

;; go to today's journal
(defun goto-today-journal () (interactive)
       (find-file
        (concat org-journal-dir "/" (format-time-string org-journal-file-format))))

;; go to personal.org
(defun goto-personal () (interactive)
       (find-file
        (concat org-directory "/personal.org")))

;; go to notes.org
(defun goto-notes () (interactive)
       (find-file
        (concat org-directory "/notes.org")))

;; keybindings
(map!
 (:leader
  (:prefix "TAB"
    (:desc "Next workspace"
     :n "n" #'+workspace:switch-next)
    (:desc "Previous workspace"
     :n "p" #'+workspace:switch-previous)
    (:desc "New workspace"
     :n "c" #'+workspace/new)
    (:desc "Next workspace"
     :n "SPC" #'+workspace:switch-next))
  (:prefix "i"
    (:desc "Add ISO 8601 date"
     :n "d" #'today)
    (:desc "Add ISO 8601 date and time"
     :n "D" #'today-with-time)
    (:desc "Add timestamp"
     :n "t" #'timestamp))
  (:prefix ("l" . "LSP")
    (:desc "LSP describe thing at point"
     :n "d" #'lsp-describe-thing-at-point)
    (:desc "LSP go to definition"
     :n "f" #'lsp-find-definition))
  (:prefix ("j" . "Jump to")
    (:desc "Next occurence of string"
     :n "j" #'evil-avy-goto-char-timer)
    (:desc "Today's journal"
     :n "t" #'goto-today-journal)
    (:desc "Personal.org"
     :n "p" #'goto-personal)
    (:desc "Notes.org"
     :n "n" #'goto-notes))
  (:desc "Toggles scratch buffer"
  :n "x" #'toggle-scratch)))

;; custom task priorities
(use-package! org-fancy-priorities
              :hook (org-mode . org-fancy-priorities-mode)
              :config (setq org-fancy-priorities-list '((?A . "HIGH")
                                                        (?B . "MEDIUM")
                                                        (?C . "LOW"))))
;; config Elixir LSP mode
(use-package lsp-mode
  :commands lsp
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "~/.config/elixir-ls"))

;; activate gleam-mode for .gleam files
(add-to-list 'auto-mode-alist '("\\.gleam$" . gleam-mode))

;; activate lsp-tailwindcss
(use-package! lsp-tailwindcss)

;; org-related config
(after! org
        (setq org-directory "~/meworg"
              org-cycle-separator-lines 1
              org-default-notes-file (concat org-directory "/notes.org")
              org-agenda-files (append (list (concat org-directory "/personal.org")) (directory-files-recursively (concat org-directory "/projects") "\\.org$"))
              org-todo-keywords '((sequence "IDEA(i)" "TODO(t)" "PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
              org-todo-keyword-faces '(("IDEA" . "mediumpurple1")
                                       ("TODO" . "turquoise2")
                                       ("PROGRESS" . "chartreuse2")
                                       ("WAITING" . "grey42")
                                       ("DONE" . "grey42")
                                       ("CANCELLED" . "grey42"))
              org-journal-dir (concat org-directory "/journal/daily")
              org-journal-date-prefix "#+title: "
              org-journal-date-format "%Y-%m-%d"
              org-journal-file-format "%Y-%m-%d.org"
              org-journal-time-prefix "\n* "
              org-journal-hide-entries-p nil
              org-babel-clojure-backend 'cider
              org-link-file-path-type 'relative
              org-capture-templates '(("t" "Personal todo" entry
                                       (file+headline (lambda () (concat org-directory "/personal.org")) "Tasks")
                                       "* TODO %?" :empty-lines-before 1)
                                      ("n" "Personal note" entry
                                       (file (lambda () (concat org-directory "/notes.org")))
                                       "* %?" :empty-lines-before 1)
                                      ("i" "New idea" entry
                                       (file (lambda () (concat org-directory "/ideas.org")))
                                       "* %?" :empty-lines-before 1))
              org-plantuml-jar-path (expand-file-name "~/.config/plantuml/plantuml.jar")
              org-ditaa-jar-path (expand-file-name "~/.config/ditaa/ditaa.jar")
              ob-mermaid-cli-path "/opt/homebrew/opt/mermaid-cli/bin/mmdc"
              deft-directory org-directory
              deft-extensions '("org")
              deft-recursive t))

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("letter"
                 "\\documentclass{letter}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(add-hook 'org-mode-hook 'org-fragtog-mode)

(use-package! org-autolink)
(after! org (set-company-backend! 'org-mode 'org-links-backend))
(after! org-journal (set-company-backend! 'org-journal-mode 'org-links-backend))
