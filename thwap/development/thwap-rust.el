(use-package rust-mode
	:straight t
	:ensure t
	:config
	(add-hook 'rust-mode-hook
		(lambda ()
			(setq indent-tabs-mode nil)
			(setq tab-width 4)
			(setq rust-format-on-save t)
			(setq rust-indent-offset 4)
			(setq rust-indent-method-chain t)
			(setq rust-indent-where-clause t)
			(setq rust-indent-where-clause)))
	:mode "\\.rs\\'")

(message "Loading rust-mode... Done")
