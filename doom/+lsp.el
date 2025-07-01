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

(add-to-list 'lsp-language-id-configuration '(sml-ts-mode . "sml"))
(add-to-list 'lsp-language-id-configuration '(futhark-mode . "futhark"))

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

;; Automatically start lsp-mode in sml-mode
(add-hook 'sml-mode-hook 'lsp)
(add-hook 'sml-ts-mode-hook 'lsp)

;; Automatically start lsp-mode in futhark-mode
(add-hook 'futhark-mode-hook 'lsp)
