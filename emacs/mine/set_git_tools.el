(require 'magit)

;; git gutter and its config
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

(provide 'set_git_tools)
