;; https://github.com/bbatsov/projectile
(require 'projectile)
(projectile-global-mode)

;; (add-hook 'after-init-hook 'global-company-mode)

;; (require 'helm-config)
;; (global-set-key (kbd "M-x") #'helm-M-x)
;; (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-x C-f") #'helm-find-files)
;; ;; (helm-linum-relative-mode 1)
;; (helm-mode 1)

;; (require 'helm-projectile)
;; (helm-projectile-on)

;; make ack-and-a-half work with brew
;; https://github.com/jhelwig/ack-and-a-half/issues/8
(setq exec-path (append exec-path '("/usr/local/bin/")))

;; http://stackoverflow.com/questions/665600/how-can-i-get-emacs-to-revert-all-unchanged-buffers-when-switching-branches-in-g
(global-auto-revert-mode)

;; enable highlight for ag searches
(require 'ag)
(setq ag-highlight-search t)

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(provide 'set_dir_management)
