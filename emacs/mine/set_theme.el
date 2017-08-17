(global-linum-mode)
(setq linum-format "%4d ")

(require 'zenburn-theme)
(load-theme 'zenburn t)
(set-default-font "PragmataPro-13")

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "gray19")
(set-face-underline-p 'hl-line t)

;; display clock in status bar --------------
;;(setq display-time-day-and-date t
;;      display-time-24hr-format t)
;;(display-time)
(size-indication-mode)

(require 'rainbow-mode)
;; http://stackoverflow.com/questions/16048231/how-to-enable-a-package-mode-on-emacs-startup
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(my-global-rainbow-mode 1)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; (require 'focus)
;; (add-hook 'prog-mode-hook 'focus-mode)
;; (setq focus-dimness -1)


(require 'highlight-indent-guides)
;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; (setq highlight-indent-guides-method 'character)
;; (set-face-background 'highlight-indent-guides-odd-face "darkgray")
;; (set-face-background 'highlight-indent-guides-even-face "darkgray")

;; (global-aggressive-indent-mode 1)
;; (add-to-list
;;  'aggressive-indent-dont-indent-if
;;  '(and (derived-mode-p 'c++-mode)
;;        (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
;;                            (thing-at-point 'line)))))

(setq sml/no-confirm-load-theme t)
(sml/setup)
(smart-mode-line-enable 1)
(setq sml/theme 'respectful)
(setq sml/shorten-directory t)
(setq sml/shorten-modes t)


;; ;; Customizing colors used in diff mode
;; (defun custom-diff-colors ()
;;   "update the colors for diff faces"
;;   (set-face-attribute
;;    'diff-added nil :foreground "green")
;;   (set-face-attribute
;;    'diff-removed nil :foreground "red")
;;   (set-face-attribute
;;    'diff-changed nil :foreground "purple"))
;; (eval-after-load "diff-mode" '(custom-diff-colors))

;; (custom-set-faces
;;  '(magit-diff-added ((t (:background "black" :foreground "green3"))))
;;  '(magit-diff-removed ((t (:background "black" :foreground "red3")))))


(provide 'set_theme)
