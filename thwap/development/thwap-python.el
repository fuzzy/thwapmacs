(when (memq 'elpymode thwap-development)
	(use-package elpy
		:straight t
		:defer t
		:config
		(elpy-enable)))

(when (not (memq 'elpymode thwap-development))
	(add-hook 'python-mode-hook (lambda ()
																(setq-local tab-width 2)))
	(add-hook 'python-mode-hook #'lsp-deferred))

(when (executable-find "pylsp")
	(add-hook 'python-mode-hook 'eglot-ensure))

(use-package python-black
	:demand t
	:straight t
	:after python
	:hook (python-mode . python-black-on-save-mode))

(message "python-mode loaded")
