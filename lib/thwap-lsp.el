
(when thwap-dev-enable-lsp
	(straight-use-package 'lsp-mode)
	(straight-use-package 'lsp-ui)
	(straight-use-package 'lsp-treemacs)
	(setq gc-cons-threshold 100000000)
	(setq read-process-output-max (* 1024 1024))
	(thwap/add-key-binding "l" 'lsp-keymap-prefix "lsp-keymap-prefix"))

(provide 'thwap-lsp)
