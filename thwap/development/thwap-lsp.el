(use-package lsp-mode
	:straight t
	:demand t)
(use-package lsp-ui
	:straight t
	:demand t)
(when (eq 'treemacs thwap-dirbrowser)
	(use-package lsp-treemacs
		:straight t
		:demand t))
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(thwap/add-key-binding "l" 'lsp-keymap-prefix "lsp-keymap-prefix")
(use-package eglot
	:straight t
	:defer t
	:config
	(require 'eglot))
(message "lsp-mode loaded")
