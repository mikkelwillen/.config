;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; pdf tools package
(package! pdf-tools)

;; tablist package
(package! tablist)

;; Drag-stuff package to move lines and words
(package! drag-stuff)

;; Execution path
(package! exec-path-from-shell)
(package-initialize)

;; copilot package
(package! copilot
   :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el")))

;; copilot-chat
(package! copilot-chat
   :recipe (:host github :repo "chep/copilot-chat.el" :files ("*.el")))

;; Nix-mode
(package! nix-mode
    :recipe (:host github :repo "NixOS/nix-mode" :files ("*.el")))

;; install eyebrowse
(package! eyebrowse)

;; install nerd-icons
(package! nerd-icons)
(package! nerd-icons-dired)
(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

;; install fish-mode
(package! fish-mode)

