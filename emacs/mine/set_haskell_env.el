;;(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(setq haskell-program-name "/opt/boxen/homebrew/Cellar/ghc/7.6.3/bin/ghci")

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'haskell-interactive-mode)

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

(provide 'set_haskell_env)
