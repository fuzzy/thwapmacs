(use-package yasnippet
  :ensure t
  :straight t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets")))
  ;; (yas-global-mode 1))

(use-package yasnippet-snippets
	:ensure t
	:straight t
	:after yasnippet
	:config
	(yas-reload-all)
	(yas-global-mode 1))

;; yasnippet stuff
(thwap/add-key-binding "y n" 'yas-new-snippet "Create a new yasnippet")

(provide 'thwap-yas)
