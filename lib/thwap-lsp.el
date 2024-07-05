
(straight-use-package 'lsp-mode)

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(define-key thwap-map (kbd "l") 'lsp-keymap-prefix)
(add-to-list 'thwap-help-lines "C-c t l     : lsp-keymap-prefix")
;; (lsp-enable-which-key-integration t)

(provide 'thwap-lsp)
