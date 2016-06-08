;; ;; https://github.com/technomancy/emacs-starter-kit/
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://stable.melpa.org/packages/") t)

;; activate all the packages (in particular autoloads)
(package-initialize)

;; TODO this was an attempt at downloading/upgrading necessary packages
;; http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name
;; ;; fetch list of available packages
;; ;; (unless package-archive-contents
;; (or (file-exists-p package-user-dir)
;;   (package-refresh-contents))

;; (setq package-list '(flycheck))

;; ;; install the missing packages
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))

(provide 'set_package_manager)
