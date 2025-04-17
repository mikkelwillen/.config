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

;; Register the Millet language server with lsp-mode
(after! lsp-mode
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("millet-ls"))
    :major-modes '(sml-ts-mode)
    :server-id 'millet)))

;; Automatically start lsp-mode in sml-mode
(add-hook 'sml-mode-hook 'lsp)
(add-hook 'sml-ts-mode-hook 'lsp)
