;; Or if you installed Cask via Homebrew:
;; http://cask.readthedocs.io/en/latest/guide/usage.html

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; for some reason cask-initialize does not seem to work in some
;; systems so I have to require it by hand
(let ((default-directory  "~/.emacs.d/.cask/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Keep ~Cask~ file in sync with the packages
;; installed/uninstalled via ~M-x list-packages~
;; https://github.com/rdallasgray/pallet
(require 'pallet)

(add-to-list 'load-path "~/.emacs.d/mine")

;;(require 'set_emacs_server)
(require 'set_bindings)
(require 'set_package_manager)
(require 'set_my_customization)
(require 'set_theme)
(require 'set_git_tools)
(require 'set_hooks)
(require 'set_linter_tools)
(require 'set_dir_management)
(require 'set_yaml_tools)
(require 'set_ruby_env)
(require 'set_haskell_env)
(require 'set_web_tools)
(require 'set_misc)

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; unorganized mess.............

;; (require 'multi-term)
;; (setq multi-term-program "/bin/bash")
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq py-install-directory "/usr/bin/python")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(load "/Users/lu/code/emacs-haskell-config/init.el")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(require 'whitespace)
(setq whitespace-style '(lines))
(setq whitespace-line-column 78)
(global-whitespace-mode 1)
(setq whitespace-style '(face empty tabs lines-tail trailing))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-long-line-face ((((class color)) (:background "red"))) t)
 '(my-tab-face ((((class color)) (:background "orange"))) t)
 '(my-trailing-space-face ((((class color)) (:background "red"))) t))

(defvar my-linum-format-string "%4d \u2502 ")

;; (add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)

;; (defun my-linum-get-format-string ()
;;   (let* ((width (1+ (length (number-to-string
;;                              (count-lines (point-min) (point-max))))))
;;          (format (concat "%" (number-to-string width) "d ")))
;;     (setq my-linum-format-string format)))

;; (defvar my-linum-current-line-number 0)

;; (setq linum-format 'my-linum-relative-line-numbers)

;; (defun my-linum-relative-line-numbers (line-number)
;;   (let ((offset (- line-number my-linum-current-line-number)))
;;     (propertize (format my-linum-format-string (abs offset)) 'face 'linum)))

;; (defadvice linum-update (around my-linum-update)
;;   (let ((my-linum-current-line-number (line-number-at-pos)))
;;     ad-do-it))
;; (ad-activate 'linum-update)

(provide 'init)

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)
;;show-paren-mode allows one to see matching pairs of parentheses
;; and other characters
(show-paren-mode 1)
(menu-bar-mode -1) ;; remove useless menu bar

;; flyckeck

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(package-selected-packages
   (quote
    (php-mode dockerfile-mode docker cql-mode use-package ensime feature-mode apib-mode colemak-evil evil-visual-mark-mode zenburn-theme yaml-mode web-mode wc-mode smart-mode-line-powerline-theme rainbow-mode rainbow-delimiters python-mode projectile pallet markdown-mode magit json-mode js2-mode id-manager highlight-indent-guides haml-mode git-gutter focus flycheck exec-path-from-shell evil column-marker auto-complete alchemist aggressive-indent ag ack-and-a-half))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;;Replace all freakin' ^M chars in the current buffer
(fset 'replace-ctrlms
   [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])
(global-set-key "\C-cm" 'replace-ctrlms)
