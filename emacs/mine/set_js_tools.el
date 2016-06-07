(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/jade-mode"))
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/flymake-jslint-0.10"))
(require 'flymake-jslint)
    (add-hook 'js-mode-hook 'flymake-jslint-load)

(setq flymake-jslint-command "/opt/boxen/nodenv/versions/v0.10.21/bin/jslint")

(defun flymake-jade-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                 'flymake-create-temp-intemp))
     (local-file (file-relative-name
                  temp-file
                  (file-name-directory buffer-file-name)))
     (arglist (list local-file)))
    (list "jade" arglist)))
(setq flymake-err-line-patterns
       (cons '("\\(.*\\): \\(.+\\):\\([[:digit:]]+\\)$"
              2 3 nil 1)
            flymake-err-line-patterns))
(add-to-list 'flymake-allowed-file-name-masks
         '("\\.jade\\'" flymake-jade-init))

(provide 'set_js_tools)
