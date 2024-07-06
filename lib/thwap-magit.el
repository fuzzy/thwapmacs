
(when thwap-dev-enable-magit
	(straight-use-package 'magit)
	(straight-use-package 'forge)
	(straight-use-package 'magit-todos)
	(define-key thwap-map (kbd "g s") 'magit-status)
	(add-to-list 'thwap-help-lines "C-c t g s   : magit-status"))

(provide 'thwap-magit)
