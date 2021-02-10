(require 'cask)
(cask-initialize)

;; Keep ~Cask~ file in sync with the packages
;; installed/uninstalled via ~M-x list-packages~
;; https://github.com/rdallasgray/pallet
(require 'pallet)

;; ------------ keybindings --------------- ;;
(windmove-default-keybindings)

;; ----------------- styling -------------- ;;
;; remove useless menu bar
(menu-bar-mode -1)

;; show column number
(setq column-number-mode t)

;; display file size and line
(size-indication-mode)

;; display line numbers globally
;; (global-display-line-numbers-mode t)

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "gray20")

;; rainbow delimeters for parentheses
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; theme
(require 'zenburn-theme)
(load-theme 'zenburn t)

(global-tab-line-mode 1)
(global-visual-line-mode 1)

(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

;; auto close bracket insertion.
(electric-pair-mode 1)

;; see matching pairs of parentheses and other characters
(show-paren-mode 1)

;; highlight trailing whitespace
(setq-default show-trailing-whitespace t)
(setq whitespace-style '(face empty tabs lines-tail trailing))

(setq default-tab-width 2)

;; ----------------- indentation --------------- ;;

;; highlight indentation
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

;;  keep code always indented
(global-aggressive-indent-mode 1)

;; ---------------- git ------------------------ ;;
(require 'magit)

(require 'git-gutter)
(global-git-gutter-mode t)
(custom-set-variables
 '(git-gutter:unchanged-sign "  ")
 '(git-gutter:modified-sign "~ ")
 '(git-gutter:added-sign "+ ")
 '(git-gutter:deleted-sign "- "))
(set-face-background 'git-gutter:modified "yellow")
(set-face-background 'git-gutter:added "green")
(set-face-background 'git-gutter:deleted "red")
(set-face-background 'git-gutter:unchanged "black")
(set-face-foreground 'git-gutter:modified "gray20")
(set-face-foreground 'git-gutter:added "gray20")
(set-face-foreground 'git-gutter:deleted "gray20")
(set-face-foreground 'git-gutter:unchanged "gray20")

;; revert all unchanged buffers when switching branches
(global-auto-revert-mode)

;; -------------- global hooks ----------------- ;;
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; -------------- linter ------------------------ ;;
(add-hook 'after-init-hook #'global-flycheck-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; ----------------- dir & proj management ---------- ;;
;; project interaction
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
(setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; -------------------- misc ------------------------- ;;
(global-undo-tree-mode)

;; -------------------- org-mode ---------------------- ;;
;; org-mode
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "WAITING(w)"
		        "REVIEW(r)"
			"|" "DONE(d)" "DEFERRED(f)" "CANCELED(c)"))))
(setq org-todo-keyword-faces
      (quote (("TODO"      :foreground "red"          :weight bold)
	      ("NEXT"      :foreground "blue"         :weight bold)
	      ("STARTED"   :foreground "cyan"         :weight bold)
	      ("WAITING"   :foreground "gold"         :weight bold)
	      ("REVIEW"    :foreground "magenta"      :weight bold)
	      ("DONE"      :foreground "forest green" :weight bold)
	      ("DEFERRED"  :foreground "dark red"     :weight bold)
	      ("CANCELED" :foreground "dark red"     :weight bold))))

;; org-mode support for go
(org-babel-do-load-languages
 'org-babel-load-languages
 '((go . t)))

;; Indent headings by level
(customize-set-variable 'org-startup-indented t)
;; Don't turn on truncating long lines in org mode
(customize-set-variable 'org-startup-truncated nil)

;; syntax highlighting for coding blocks
(setq org-src-fontify-natively t)

;; ---------------------- golang ---------------------- ;;
;; golang config
(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
			  5 │                         (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

;; TODO TODO
(add-to-list 'exec-path (concat (getenv "HOME") "/go/bin"))
(add-to-list 'exec-path (concat (getenv "HOME") "/.go/bin"))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; TODO
;; lsp-register-custom-settings symbol definition is void
;; (lsp-register-custom-settings
;; '(("gopls.completeUnimported" t t)
;;   ("gopls.staticcheck" t t)))
(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; company-lsp integrates company mode completion with lsp-mode.
;; completion-at-point also works out of the box but doesn't support snippets.
(use-package company-lsp
  :ensure t
  :commands company-lsp)

;; ui-doc shows in minibuffer
(setq lsp-ui-doc-enable nil
      lsp-ui-peek-enable t
      lsp-ui-sideline-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t)


;; --------------- yaml --------------------- ;;
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-hook 'yaml-mode-hook
          '(lambda ()
	     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; --------------- some copying shortcuts & keybindings -------------- ;;
;; https://www.emacswiki.org/emacs/CopyWithoutSelection

(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point))

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "Copy thing between beg & end into kill ring."
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end))))

(defun paste-to-mark (&optional arg)
  "Paste things to mark, or to the prompt in shell-mode."
  (unless (eq arg 1)
    (if (string= "shell-mode" major-mode)
        (comint-next-prompt 25535)
      (goto-char (mark)))
    (yank)))

(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  ;;(paste-to-mark arg)
  )

(global-set-key (kbd "C-c w")         (quote copy-word))

(defun copy-backward-word ()
  "copy word before point - rocky @ stackexchange"
  (interactive "")
  (save-excursion
    (let ((end (point))
	  (beg (get-point 'backward-word 1)))
      (copy-region-as-kill beg end))))

(global-set-key (kbd "C-c W") 'copy-backward-word)

(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line "
  (interactive "P")
  (copy-thing 'beginning-of-line 'end-of-line arg)
  (paste-to-mark arg)
  )

(global-set-key (kbd "C-c l")         (quote copy-line))

(defun kill-matching-lines (regexp &optional rstart rend interactive)
  "Kill lines containing matches for REGEXP.

See `flush-lines' or `keep-lines' for behavior of this command.

If the buffer is read-only, Emacs will beep and refrain from deleting
the line, but put the line in the kill ring anyway.  This means that
you can use this command to copy text from a read-only buffer.
\(If the variable `kill-read-only-ok' is non-nil, then this won't
even beep.)"
  (interactive
   (keep-lines-read-args "Kill lines containing match for regexp"))
  (let ((buffer-file-name nil)) ;; HACK for `clone-buffer'
    (with-current-buffer (clone-buffer nil nil)
      (let ((inhibit-read-only t))
        (keep-lines regexp rstart rend interactive)
        (kill-region (or rstart (line-beginning-position))
                     (or rend (point-max))))
      (kill-buffer)))
  (unless (and buffer-read-only kill-read-only-ok)
    ;; Delete lines or make the "Buffer is read-only" error.
    (flush-lines regexp rstart rend interactive)))
