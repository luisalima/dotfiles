;;; set_theme --- sets styling configurations

;; remove useless menu bar
(menu-bar-mode -1)

;; styling theme
(require 'zenburn-theme)
(load-theme 'zenburn t)

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "gray14")

;; show column number
(setq column-number-mode t)

;; display file size and line
(size-indication-mode)

;; display line numbers globally
(global-display-line-numbers-mode t)

;; rainbow delimeters for parentheses
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; highlight indentation
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

;;  keep code always indented
(global-aggressive-indent-mode 1)

;; auto close bracket insertion.
(electric-pair-mode 1)

;; see matching pairs of parentheses and other characters
(show-paren-mode 1)

;; highlight trailing whitespace
(setq-default show-trailing-whitespace t)
;; (setq whitespace-style '(face empty tabs lines-tail trailing))

(provide 'set_theme)
;;; set_theme.el ends here
