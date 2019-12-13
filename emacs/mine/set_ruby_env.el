;; (require 'pry)
;; ;; optional suggestions
;; (global-set-key [S-f9] 'pry-intercept)
;; (global-set-key [f9] 'pry-intercept-rerun)

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

;; ;; http://www.rubytapas.com/episodes/56-xmpfilter
;; (require 'rcodetools)
;; (define-key ruby-mode-map (kbd "C-c C-c") 'xmp)
(add-hook 'ruby-mode-hook 'robe-mode)

(provide 'set_ruby_env)
