;;; +golden-ratio.el -*- lexical-binding: t; -*-
;; Uses https://github.com/roman/golden-ratio.el
;; Changed mouse-leave-buffer-hook to hook to evil-window commands

(eval-when-compile (require 'cl-lib))

(defun hook-golden-ratio-to-fun (&rest _args)
  "Function to hook to window change"
  (let ((dims (golden-ratio--dimensions)))
    (balance-windows)
    (golden-ratio--resize-window dims)))

;; Hook to when window configuration changes
(add-hook 'window-configuration-change-hook #'hook-golden-ratio-to-fun)

;; Hook to when mouse enters another buffer
(add-hook 'mouse-leave-buffer-hook #'hook-golden-ratio-to-fun)

;; Hook to when window is changed
;; Thought `mouse-leave-buffer-hook` should be sufficient, but it does not
;; trigger, when changing windows fast with keybinds.
(dolist (cmd '(evil-window-left evil-window-right evil-window-up evil-window-down))
  (advice-add cmd :after #'hook-golden-ratio-to-fun))
