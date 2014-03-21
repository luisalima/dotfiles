;; https://github.com/senny/rvm.el
;; https://github.com/eschulte/rinari/issues/24
(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs
;; session

;; ;; rinari for RoR
;; (require 'rinari)

(add-to-list 'load-path "~/.emacs.d/vendor/haml-mode/")
(require 'haml-mode)


(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)
;; optional suggestions
(global-set-key [S-f9] 'pry-intercept)
(global-set-key [f9] 'pry-intercept-rerun)

;; ;; make pry work with inf-ruby
;; ;; stolen from https://gist.github.com/jsvnm/1390890
;; (add-to-list 'inf-ruby-implementations '("pry" . "pry"))
;; (setq inf-ruby-default-implementation "pry")
;; (setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
;; (setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")

;; (require 'rspec-mode)
;; (defadvice rspec-compile (around rspec-compile-around)
;;   "Use BASH shell for running the specs because of ZSH issues."
;;   (let ((shell-file-name "/bin/bash"))
;;     ad-do-it))
;; (ad-activate 'rspec-compile)

;; ;; cucumber
;; ;; run features in a compilation buffer
;; (require 'feature-mode)
;; (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; http://www.rubytapas.com/episodes/56-xmpfilter
(add-to-list 'load-path "~/.emacs.d/vendor/rcodetools/")
(require 'rcodetools)
(define-key ruby-mode-map (kbd "C-c C-c") 'xmp)

(provide 'set_ruby_env)
