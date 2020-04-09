(require 'ido)
(ido-mode t)


;; word-count mode
(require 'wc-mode)
(global-set-key "\C-cw" 'wc-mode)

(define-globalized-minor-mode my-global-wc-mode wc-mode
  (lambda () (wc-mode 1)))

(my-global-wc-mode 1)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "gfm-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; ;; http://emacs.stackexchange.com/questions/10900/copy-text-from-emacs-to-os-x-clipboard
;; (defun copy-from-osx ()
;;   (shell-command-to-string "pbpaste"))

;; (defun paste-to-osx (text &optional push)
;;   (let ((process-connection-type nil))
;;     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;       (process-send-string proc text)
;;       (process-send-eof proc))))

;; (setq interprogram-cut-function 'paste-to-osx)
;; (setq interprogram-paste-function 'copy-from-osx)

;; ;;Replace all freakin' ^M chars in the current buffer
;; (fset 'replace-ctrlms
;;    [escape ?< escape ?% ?\C-q ?\C-m return ?\C-q ?\C-j return ?!])
;; (global-set-key "\C-cm" 'replace-ctrlms)

(provide 'set_misc)
