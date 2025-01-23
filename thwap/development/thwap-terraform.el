(use-package terraform-mode
	:straight t
	:config
	(setq terraform-format-on-save t
				terraform-indent-level 2)
	(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
	:defer t)

(when (eq 'company thwap-completion)
	(use-package company-terraform
		:straight t
		:defer t
		:config
		(add-hook 'terraform-mode-hook #'company-terraform-init)))

(message "terraform-mode loaded")
