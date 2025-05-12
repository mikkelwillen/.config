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
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

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

;; fsautocomplete
(package! fsharp-mode)

;; Fsharp treesitter mode
(package! fsharp-ts-mode
  :recipe (:host github :repo "KaranAhlawat/fsharp-ts-mode" :files ("*.el")))

;; install sml-ts-mode and load it
(package! sml-ts-mode)
(use-package sml-ts-mode
  :ensure t
  :mode "\\.sml\\'" "\\.mlb\\'" "\\.sig\\'")

;; install c lsp
(package! ccls)

;; install python lsp
(package! lsp-pyright)

;; install elsa lsp
;; (package! elsa)

;; install golden-ratio
(package! golden-ratio)

;; install and configure tree-sitter
(require 'treesit-langs)
(treesit-langs-major-mode-setup)

;; Loads fasto-mode from /./
(add-load-path! ".")
(require 'fasto-mode)
