;;; +lsp.el -*- lexical-binding: t; -*-

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp)))
  :hook (python-ts-mode . (lambda ()
			    (require 'lsp-pyright)
			    (lsp))))

;; ;; LSP for Nix
;; (use-package lsp-nix
;;   :ensure lsp-mode
;;   :after (lsp-mode)
;;   :demand t
;;   :custom
;;   (lsp-nix-nil-formatter ["nixfmt"]))

(add-to-list 'lsp-language-id-configuration '(sml-ts-mode . "sml"))
(add-to-list 'lsp-language-id-configuration '(futhark-mode . "futhark"))
(add-to-list 'lsp-language-id-configuration '(haskell-ts-mode . "haskell"))

;; Register the Millet language server with lsp-mode
(after! lsp-mode
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("millet-ls"))
    :activation-fn(lsp-activate-on "sml")
    :server-id 'millet)))

;; Register the Futhark language server with lsp-mode
(after! lsp-mode
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("futhark lsp"))
    :activation-fn (lsp-activate-on "futhark")
    :server-id 'futhark-lsp)))

;; Register the Haskell Language Server with lsp-mode for haskell-ts-mode
(after! lsp-mode
  (lsp-register-client
   (make-lsp-client
	:new-connection (lsp-stdio-connection '("haskell-language-server-wrapper --lsp"))
	:activation-fn (lsp-activate-on "haskell")
	:server-id 'haskell-lsp)))

;; Automatically start lsp-mode in sml-mode
(add-hook 'sml-mode-hook 'lsp)
(add-hook 'sml-ts-mode-hook 'lsp)

;; Automatically start lsp-mode in futhark-mode
(add-hook 'futhark-mode-hook 'lsp)

;; Automatically start lsp-mode in haskell-ts-mode
(add-hook 'haskell-ts-mode-hook 'lsp)
