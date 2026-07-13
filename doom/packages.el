;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; pdf tools package
(package! pdf-tools)

;; tablist package
(package! tablist)

;; drag-stuff package to move lines and words
(package! drag-stuff)

;; futhark mode
(package! futhark-mode)

;; execution path
(package! exec-path-from-shell)

;; install eyebrowse
(package! eyebrowse)

;; install nerd-icons
(package! nerd-icons)

;; install nerd-icons-dired
(package! nerd-icons-dired)

;; install fish-mode
(package! fish-mode)

;; fsautocomplete
(package! fsharp-mode)

;; install c lsp
(package! ccls)

;; install python lsp
(package! lsp-pyright)

;; install golden-ratio
(package! golden-ratio)

;; install idle-highlight-mode
(package! idle-highlight-mode)

;; install doc-toc
;; (package! doc-toc) ;; Missing dependencies.


;;; From github repos

;; copilot package
(package! copilot
  :recipe (:host github
	   :repo "copilot-emacs/copilot.el"
	   :files ("*.el")))

;; copilot-chat
(package! copilot-chat
  :recipe (:host github
	   :repo "chep/copilot-chat.el"
	   :files ("*.el")))

;; nix-mode
(package! nix-mode
  :recipe (:host github
	   :repo "NixOS/nix-mode"
	   :files ("*.el")))

;; Fsharp treesitter mode
(package! fsharp-ts-mode
  :recipe (:host github
	   :repo "KaranAhlawat/fsharp-ts-mode"
	   :files ("*.el")))
