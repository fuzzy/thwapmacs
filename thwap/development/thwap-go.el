(use-package go-mode
	:straight t
	:demand t
	:config
	(add-hook 'go-mode-hook 'font-lock-mode))

;; (global-font-lock-mode 1)

(use-package go-eldoc
	:straight t
	:demand t)

(use-package go-projectile
	:straight t
	:demand t)

(use-package go-snippets
	:straight t
	:demand t)

(setq lsp-go-analyses '((shadow . t)
												(simplifycompositelit . :json-false)))

(when (executable-find "gopls")
	(add-hook 'go-mode-hook #'lsp-deferred))

(when (executable-find "goimports")
	(setq gofmt-command "goimports"))

(add-hook 'before-save-hook 'gofmt-before-save)

(message "go-mode loaded")
