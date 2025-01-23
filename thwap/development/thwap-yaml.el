(use-package yaml-mode
	:straight t
	:defer t
	:config
	(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
	(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
	;; yaml-mode is a bit too aggressive with its indentation
	;; so we'll disable it and use the default
	(add-hook 'yaml-mode-hook
						(lambda ()
							(setq-local electric-indent-inhibit t)
							(setq-local electric-layout-rules nil))))

(message "yaml-mode loaded")
