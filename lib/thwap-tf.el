(when thwap-dev-enable-terraform
	(use-package terraform-mode
		:straight t
		:demand t
		:init
		(custom-set-variables
		 '(terraform-indent-level 2)
		 '(terraform-format-on-save t))
		(when (executable-find "terraform-ls")
			(add-hook 'terraform-mode-hook 'eglot-ensure))
		:config
		(straight-use-package 'eglot)
		(require 'eglot)
		(add-to-list 'eglot-server-programs
								 `(terraform-mode . ("terraform-ls" "serve"))))
	(add-hook 'terraform-mode-hook #'lsp-deferred))

(provide 'thwap-tf)
