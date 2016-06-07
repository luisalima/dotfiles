(add-to-list 'load-path "~/.emacs.d/mine")

(require 'set_emacs_server)
(require 'set_package_manager)
(require 'set_theme)
(require 'set_shortcuts)
(require 'set_hooks)
(require 'set_dir_management)
(require 'set_yaml_tools)
(require 'set_password_management)
(require 'set_my_customization)
(require 'set_ruby_env)
(require 'set_haskell_env)
(require 'set_js_tools)
(require 'set_scss_tools)
(require 'set_misc)
(require 'set_linter_tools)
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

(setq js-indent-level 2)
(setq javascript-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(custom-set-faces
  '(my-tab-face            ((((class color)) (:background "orange"))) t)
  '(my-trailing-space-face ((((class color)) (:background "red"))) t)
  '(my-long-line-face ((((class color)) (:background "red"))) t))

(global-git-gutter-mode +1)

(provide 'init)

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)
;;show-paren-mode allows one to see matching pairs of parentheses
;; and other characters
(show-paren-mode 1)

;; flyckeck

;;; init.el ends here
