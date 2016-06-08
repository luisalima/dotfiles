(global-linum-mode)


(load-theme 'zenburn t)
(set-default-font "PragmataPro-13")

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "gray19")
(set-face-underline-p 'hl-line t)

;; display clock in status bar --------------
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

(require 'rainbow-mode)
;; http://stackoverflow.com/questions/16048231/how-to-enable-a-package-mode-on-emacs-startup
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(my-global-rainbow-mode 1)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(provide 'set_theme)
