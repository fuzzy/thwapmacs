
(when thwap-dev-enable-go
	(straight-use-package 'go-mode)
	(straight-use-package 'eglot)
	(setq lsp-go-analyses '((shadow . t)
													(simplifycompositelit . :json-false)))
	(when (executable-find "gopls")
		(add-hook 'go-mode-hook #'lsp-deferred)
		(add-hook 'go-mode-hook 'eglot-ensure))
	(when (executable-find "goimports")
		(setq gofmt-command "goimports"))
	(add-hook 'before-save-hook 'gofmt-before-save))
		

(provide 'thwap-go)
