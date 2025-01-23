(use-package go-mode
	:straight t
	:defer t)

(use-package go-eldoc
	:straight t
	:defer t)

(use-package go-projectile
	:straight t
	:defer t)

(use-package go-snippets
	:straight t
	:defer t)

(setq lsp-go-analyses '((shadow . t)
												(simplifycompositelit . :json-false)))

(when (executable-find "gopls")
	(add-hook 'go-mode-hook #'lsp-deferred)
	(add-hook 'go-mode-hook 'eglot-ensure))

(when (executable-find "goimports")
	(setq gofmt-command "goimports"))

(add-hook 'before-save-hook 'gofmt-before-save)

(message "go-mode loaded")
