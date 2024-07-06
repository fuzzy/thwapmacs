
(when thwap-comp-enable-lsp
	(straight-use-package 'lsp-mode)
	(straight-use-package 'lsp-ui)
	(straight-use-package 'lsp-treemacs)
	(setq gc-cons-threshold 100000000)
	(setq read-process-output-max (* 1024 1024))
	(define-key thwap-map (kbd "l") 'lsp-keymap-prefix)
	(add-to-list 'thwap-help-lines "C-c t l     : lsp-keymap-prefix"))

(provide 'thwap-lsp)
