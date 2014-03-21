(require 'ido)
(ido-mode t)

;; Convenient printing
(require 'printing)
(pr-update-menus t)
; make sure we use localhost as cups server
(setenv "CUPS_SERVER" "localhost")
(require 'cups)


;;go to the last change
(require 'goto-last-change)
(global-set-key [(control .)] 'goto-last-change)
; M-. can conflict with etags tag search. But C-. can get overwritten
; by flyspell-auto-correct-word. And goto-last-change needs a really
; fast key.
(global-set-key [(meta .)] 'goto-last-change)


(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

(provide 'set_misc)
