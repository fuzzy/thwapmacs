(add-to-list 'thwap-base-hydra-map '("g" "MaGit" 'thwap-magit-hydra/body))
(setq thwap-magit-hydra-map '(("s" "Git status" 'magit-status)
															("l" "Git log" 'magit-log)
															("b" "Git blame" 'magit-blame)
															("f" "Git find file" 'magit-find-file)))
(use-package magit
	:straight t
	:demand t)

(thwap/add-key-binding "g s" 'magit-status "Git status (magit entrypoint)")
(thwap/add-key-binding "g l" 'magit-log "Git log (magit entrypoint")
(thwap/add-key-binding "g b" 'magit-blame "Git blame (magit entrypoint")
(thwap/add-key-binding "g f" 'magit-find-file "Git find file (magit entrypoint")
	
(when (memq 'magitforge thwap-development)
	(use-package forge
		:straight t
		:demand t
		:after magit)

	(add-to-list 'thwap-magit-hydra-map '("C-f" "Forge" 'thwap-forge-hydra/body))
	(setq thwap-forge-hydra-map '(("p" "Forge pull" 'forge-pull)
																("a" "add repo" 'forge-add-repository)
																("l" "list topics" 'forge-list-topics)))
	(thwap/add-key-binding "f p" 'forge-pull "Update local copy of forge data / Do initial setup")
	(thwap/add-key-binding "f a" 'forge-add-repository "Add current file's repository to magit+forge")
	(thwap/add-key-binding "f l" 'forge-list-topics "Show issues/pull requests"))
	
(when (memq 'magittodos thwap-development)
	(use-package magit-todos
		:straight t
		:demand t
		:after magit
		:config
		(add-hook 'magit-mode-hook 'magit-todos-mode))
	(add-to-list 'thwap-magit-hydra-map '("t" "Git Todos" 'magit-todos-list))
	(thwap/add-key-binding "g t" 'magit-todos-list "List todos in current repository"))

(message "magit loaded"))
(provide 'thwap-magit)
