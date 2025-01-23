(use-package zig-mode
	:straight t
	:config
	(add-hook 'zig-mode-hook 'lsp)
	(add-to-list 'auto-mode-alist '("\\.zig\\'" . zig-mode)))

(message "Loading zig-mode... Done")
