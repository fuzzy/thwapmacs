(use-package dash
	:straight t
	:demand t)

(use-package editorconfig
	:straight t
	:demand t)

(use-package copilot
	:straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
	:demand t
	:ensure t
	:config
	;; you can utilize :map :hook and :config to customize copilot
	(add-hook 'prog-mode-hook 'copilot-mode)
	(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
	(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))

(message "copilot loaded")
