(add-to-list 'load-path "~/.emacs.d/mine")

(require 'set_emacs_server)
(require 'set_package_manager)
(require 'set_theme)
(require 'set_shortcuts)
(require 'set_hooks)
(require 'set_dir_management)
(require 'set_yaml_tools)

(require 'multi-term)
(setq multi-term-program "/bin/bash")
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
