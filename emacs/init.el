;; Or if you installed Cask via Homebrew:
;; http://cask.readthedocs.io/en/latest/guide/usage.html
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; Keep ~Cask~ file in sync with the packages
;; installed/uninstalled via ~M-x list-packages~
;; https://github.com/rdallasgray/pallet
(require 'pallet)

(add-to-list 'load-path "~/.emacs.d/mine")

(require 'set_emacs_server)
(require 'set_package_manager)
(require 'set_theme)
(require 'set_shortcuts)
(require 'set_hooks)
(require 'set_linter_tools)
(require 'set_dir_management)
(require 'set_yaml_tools)
(require 'set_password_management)
(require 'set_my_customization)
(require 'set_ruby_env)
(require 'set_haskell_env)
(require 'set_scss_tools)
(require 'set_misc)
(require 'set_web_tools)

;; unorganized mess.............

;; (require 'multi-term)
;; (setq multi-term-program "/bin/bash")
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq py-install-directory "/usr/bin/python")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(load "/Users/lu/code/emacs-haskell-config/init.el")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-long-line-face ((((class color)) (:background "red"))) t)
 '(my-tab-face ((((class color)) (:background "orange"))) t)
 '(my-trailing-space-face ((((class color)) (:background "red"))) t))

(global-git-gutter-mode +1)

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
    ("afbb40954f67924d3153f27b6d3399df221b2050f2a72eb2cfa8d29ca783c5a8" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(paradox-github-token t))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
