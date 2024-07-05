
(straight-use-package 'go-mode)

(setq lsp-go-analyses '((shadow . t)
												(simplifycompositelit . :json-false)))


(when (executable-find "gopls")
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook #'lsp-deferred)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'eglot-ensure))

(provide 'thwap-go)
