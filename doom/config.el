;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dark+)

;; Set the font size
(setq doom-font (font-spec :family "FiraMono Nerd Font Mono" :size 24))

;; Redefine display-line-numbers to not show line numbers in pdf-view-mode
(require 'display-line-numbers)
    (defun display-line-numbers--turn-on ()
    "Turn on `display-line-numbers-mode'."
    (unless (or (minibufferp) (eq major-mode 'pdf-view-mode))
	(display-line-numbers-mode)))

;; Always show line numbers and make them relative
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Set the delay for key popups
(setq which-key-idle-delay 0.2)

(setq
      ; Raise undo-limit to 80Mb
      undo-limit 80000000

      ; By default while in insert all changes are one big blob. Be more granular
      evil-want-fine-undo t

      ; Nobody likes to loose work, I certainly don't
      auto-save-default t

      ; Unicode ellispis are nicer than "...", and also save /precious/ space
      truncate-string-ellipsis "…"

      ; I can trust my computers ... can't I?
      password-cache-expiry nil

      ; Don't have `point' jump around
      scroll-preserve-screen-position 'always

      ; It's nice to maintain a little margin
      scroll-margin 2)

;; Iterate through camelCase words (if set to 1)
(global-subword-mode 0)

;; Set indentation to 4 spaces
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; accept completion from copilot and fallback to company
(use-package! copilot
    :hook (prog-mode . copilot-mode)
    :bind (:map copilot-completion-map
	("<tab>" . 'copilot-accept-completion)
	("TAB" . 'copilot-accept-completion)
	("C-TAB" . 'copilot-accept-completion-by-word)
	("C-<tab>" . 'copilot-accept-completion-by-word)
	("C-n" . 'copilot-next-completion)
	("C-p" . 'copilot-previous-completion))

    :config
    (add-to-list 'copilot-indentation-alist '(prog-mode 4))
    (add-to-list 'copilot-indentation-alist '(org-mode 4))
    (add-to-list 'copilot-indentation-alist '(text-mode 4))
    (add-to-list 'copilot-indentation-alist '(closure-mode 4))
    (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode 4)))

;; initialize drag-stuff
;; a package to move lines up and down
(use-package drag-stuff
  :init
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

;; Enable flycheck
;; a package to perform on-the-fly syntax checking
(use-package flycheck
  :ensure t
  :defer t
  :diminish
  :init (global-flycheck-mode))

;; Enable hl-todo
;; a package to highlight TODO, FIXME, etc. in comments and strings
(use-package hl-todo
  :hook ((org-mode . hl-todo-mode)
         (prog-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))

;; Set emacsclient to not open new workspace, when opening
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))

;; Load additional configuration files
(load! "+keybinds")
