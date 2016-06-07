(add-to-list 'load-path "~/.emacs.d/vendor/haml-mode/")
(require 'haml-mode)

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-pry")
(require 'pry)
;; optional suggestions
(global-set-key [S-f9] 'pry-intercept)
(global-set-key [f9] 'pry-intercept-rerun)

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
