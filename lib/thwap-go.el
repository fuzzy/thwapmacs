(require 'thwap-lsp)

(straight-use-package 'go-mode)

(setq lsp-go-analyses '((shadow . t)
												(simplifycompositelit . :json-false)))


