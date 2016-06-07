;;; package --- Summary
;;; Commentary:
;;; This requires flycheck and sets global flycheck mode
(require 'package)

;;; Code:
(package-initialize)

(package-install 'flycheck)

(global-flycheck-mode)

(provide 'set_linter_tools)
;;; set_linter_tools.el ends here
