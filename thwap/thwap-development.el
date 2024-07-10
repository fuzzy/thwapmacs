
;;
;; development assistance packages
;;

;; dev layer toggles
(defcustom thwap-development nil
	"Whether or not to enable development assistance packages."
	:type '(set (const :tag "None" nil)
							(const :tag "lsp" lspmode) ;; generally required for other modes
							(const :tag "magit" magitmode) ;; git integration
							(const :tag "projectile" projectilemode) ;; project management
							(const :tag "copilot" copilotmode) ;; code completion
							(const :tag "go" gomode) ;; go language support
							(const :tag "python" pythonmode) ;; python language support
							(const :tag "elpy" elpymode) ;; python language support (elpy)							
							(const :tag "terraform" terraformmode) ;; terraform language support
							(const :tag "yaml" yamlmode)) ;; yaml language support
	:group 'thwap-config)


;; lsp-mode
(when (memq 'lspmode thwap-development)
	(straight-use-package 'lsp-mode)
	(straight-use-package 'lsp-ui)
	(when (eq 'treemacs thwap-dirbrowser)
		(straight-use-package 'lsp-treemacs))
	(setq gc-cons-threshold 100000000)
	(setq read-process-output-max (* 1024 1024))
	(thwap/add-key-binding "l" 'lsp-keymap-prefix "lsp-keymap-prefix")
	(straight-use-package 'eglot)
	(require 'eglot)
	(message "lsp-mode loaded"))

;; magit
(when (memq 'magitmode thwap-development)
	(straight-use-package 'magit)
	(straight-use-package 'forge)
	(straight-use-package 'magit-todos)
	(thwap/add-key-binding "g s" 'magit-status "Git status (magit entrypoint)")
	(thwap/add-key-binding "g l" 'magit-log "Git log (magit entrypoint")
	(thwap/add-key-binding "g b" 'magit-blame "Git blame (magit entrypoint")
	(thwap/add-key-binding "g f" 'magit-find-file "Git find file (magit entrypoint")
	(message "magit loaded"))

;; projectile
(when (memq 'projectilemode thwap-development)
	(straight-use-package 'projectile)
	(thwap/add-key-binding "p" 'projectile-command-map "Projectile commands")
	(message "projectile loaded"))

;; co-pilot
(when (memq 'copilotmode thwap-development)
	(straight-use-package 'dash)
	(straight-use-package 'editorconfig)
	(use-package copilot
		:straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
		:ensure t)
	;; you can utilize :map :hook and :config to customize copilot
	(add-hook 'prog-mode-hook 'copilot-mode)
	(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
	(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
	(message "copilot loaded"))

;; go-mode
(when (memq 'gomode thwap-development)
	(straight-use-package 'go-mode)
	(straight-use-package 'go-eldoc)
	(straight-use-package 'go-projectile)
	(straight-use-package 'go-snippets)
	(setq lsp-go-analyses '((shadow . t)
													(simplifycompositelit . :json-false)))
	(when (executable-find "gopls")
		(add-hook 'go-mode-hook #'lsp-deferred)
		(add-hook 'go-mode-hook 'eglot-ensure))
	(when (executable-find "goimports")
		(setq gofmt-command "goimports"))
	(add-hook 'before-save-hook 'gofmt-before-save)
	(message "go-mode loaded"))

;; python-mode
(when (memq 'pythonmode thwap-development)
	(when (memq 'elpymode thwap-development)
		(straight-use-package 'elpy)
		(elpy-enable))
	(when (not (memq 'elpymode thwap-development))
		(add-hook 'python-mode-hook (lambda ()
																	(setq-local tab-width 2)))
		(add-hook 'python-mode-hook #'lsp-deferred))
	(when (executable-find "pylsp")
		(add-hook 'python-mode-hook 'eglot-ensure))
	(use-package python-black
		:demand t
		:straight t
		:after python
		:hook (python-mode . python-black-on-save-mode))
	(message "python-mode loaded"))

;; terraform-mode
(when (memq 'terraformmode thwap-development)
	(straight-use-package 'terraform-mode)
	(when (eq 'company thwap-completion)
		(straight-use-package 'company-terraform)
		(add-hook 'terraform-mode-hook #'company-terraform-init))
	(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
	(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
	(message "terraform-mode loaded"))

;; yaml-mode
(when (memq 'yamlmode thwap-development)
	(straight-use-package 'yaml-mode)
	(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
	(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
	;; yaml-mode is a bit too aggressive with its indentation
	;; so we'll disable it and use the default
	(add-hook 'yaml-mode-hook
						(lambda ()
							(setq-local electric-indent-inhibit t)
							(setq-local electric-layout-rules nil)))
	(message "yaml-mode loaded"))


(message "T.H.W.A.P. development assistance packages loaded")
(provide 'thwap-development)
;; thwap-development.el ends here
