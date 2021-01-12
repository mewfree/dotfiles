;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Damien Gonot"
      user-mail-address "damien.gonot@gmail.com"
      doom-theme 'doom-one
      display-line-numbers-type 'relative
      projectile-project-search '("~/dev/"))

(use-package! org-fancy-priorities
              :hook (org-mode . org-fancy-priorities-mode)
              :config (setq org-fancy-priorities-list '((?A . "HIGH")
                                                        (?B . "MEDIUM")
                                                        (?C . "LOW"))))

(after! org
        (setq org-directory "~/meworg/"
              org-agenda-files '("~/meworg/")
              org-todo-keywords '((sequence "TODO(t)" "PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
              org-todo-keyword-faces '(("TODO" . "turquoise2")
                                       ("PROGRESS" . "khaki2")
                                       ("WAITING" . "grey42")
                                       ("DONE" . "grey42")
                                       ("CANCELLED" . "grey42")
                                       )))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
