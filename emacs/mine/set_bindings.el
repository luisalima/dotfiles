;; VERY IMPORTANT!
;; it was hard to get these bindings to work. However, what was missing was this line inside tmux.conf:
;; set-window-option -g xterm-keys on

;; other references:
;; ;; http://emacs.stackexchange.com/questions/3474/windmove-keybinds-are-not-loaded
;; ;; http://stackoverflow.com/questions/13212696/emacs-input-decode-map-for-terminal
;; ;; http://lists.gnu.org/archive/html/help-gnu-emacs/2011-05/msg00211.html
;; ;; http://stackoverflow.com/questions/32370375/emacs-osx-iterm2-define-key-input-decode-map-deprecated
;; ;; https://www.emacswiki.org/emacs/EmacsForMacOS#toc26
;; (defadvice terminal-init-xterm (after map-S-up-escape-sequence
;; activate)
;;   (define-key input-decode-map "\e[1;2A" [S-up])
;; )

(windmove-default-keybindings)

(provide 'set_bindings)
