(use-package projectile
	:straight t
	:demand t
	:config
	(projectile-mode +1)
	;; (setq projectile-completion-system 'ivy)
	(add-to-list 'thwap-base-hydra-map '("p" "Project" 'projectile-command-map))
	(thwap/add-key-binding "p" 'projectile-command-map "Projectile commands"))

(message "projectile loaded")
(provide 'thwap-projectile)
