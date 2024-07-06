
(when thwap-dev-enable-projectile
	(straight-use-package 'projectile)
	(thwap/add-key-binding "p" 'projectile-command-map "Projectile commands"))

(provide 'thwap-projectile)
