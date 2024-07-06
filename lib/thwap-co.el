
;; Company and auto-complete configuration
(when (and thwap-comp-enable-company (not thwap-comp-enable-auto-complete))
	(straight-use-package 'company)
	(add-hook 'after-init-hook 'global-company-mode))

;; If auto-complete is enabled, enable it
(when (and thwap-comp-enable-auto-complete (not thwap-comp-enable-company))
	(straight-use-package 'auto-complete)
	(ac-config-default))

;; If both are enabled, disable auto-complete
(when (and thwap-comp-enable-auto-complete thwap-comp-enable-company)
	(message "Both company and auto-complete are enabled.  These are mutually exclusive.  Disabling auto-complete.")
	(straight-use-package 'company)
	(add-hook 'after-init-hook 'global-company-mode))

(provide 'thwap-co)
