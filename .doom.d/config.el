;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq user-full-name "Damien Gonot"
      user-mail-address "damien.gonot@gmail.com")

(setq
 doom-theme 'doom-one
 org-directory "~/meworg/"
 display-line-numbers-type 'relative
 projectile-project-search '("~/dev/"))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
