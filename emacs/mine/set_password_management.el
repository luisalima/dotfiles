;; for gpg
(require 'epa-file)
    (epa-file-enable)


;; for password management
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-id-manager")
(require 'id-manager)
(autoload 'id-manager "id-manager" nil t)
(global-set-key (kbd "M-7") 'id-manager)                     ; anything UI
(setq epa-file-cache-passphrase-for-symmetric-encryption t)  ; saving password
(setenv "GPG_AGENT_INFO" nil)                                ; non-GUI password dialog.

(provide 'set_password_management)
