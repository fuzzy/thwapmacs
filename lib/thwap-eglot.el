(when (or thwap-dev-enable-eglot thwap-dev-enable-lsp)
	(straight-use-package 'eglot)
	(require 'eglot))

(provide 'thwap-eglot)
