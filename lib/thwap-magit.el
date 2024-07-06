
(when thwap-dev-enable-magit
	(straight-use-package 'magit)
	(straight-use-package 'forge)
	(straight-use-package 'magit-todos)
	(thwap/add-key-binding "g s" 'magit-status "Git status (magit entrypoint)"))

(provide 'thwap-magit)
