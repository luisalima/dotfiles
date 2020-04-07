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

(depends-on "rainbow-delimiters")

;; go stuffs
(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

(add-to-list 'exec-path (concat (getenv "HOME") "/go/bin"))
(add-to-list 'exec-path "/usr/local/go/bin")

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
(require 'set_misc)

;; unorganized mess.............

;; (require 'multi-term)
;; (setq multi-term-program "/bin/bash")
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq py-install-directory "/usr/bin/python")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(require 'whitespace)
(setq whitespace-style '(lines))
(setq whitespace-line-column 78)
(global-whitespace-mode 1)
(setq whitespace-style '(face empty tabs lines-tail trailing))


(defvar my-linum-format-string "%4d \u2502 ")


(provide 'init)

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)
;;show-paren-mode allows one to see matching pairs of parentheses
;; and other characters
(show-paren-mode 1)
(menu-bar-mode -1) ;; remove useless menu bar

;; flyckeck

;;Replace all freakin' ^M chars in the current buffer
(fset 'replace-ctrlms
   [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])
(global-set-key "\C-cm" 'replace-ctrlms)

;;; init.el ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-long-line-face ((((class color)) (:background "red"))) t)
 '(my-tab-face ((((class color)) (:background "orange"))) t)
 '(my-trailing-space-face ((((class color)) (:background "red"))) t))
