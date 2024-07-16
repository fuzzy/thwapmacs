
;;
;; development assistance packages
;;

;; dev layer toggles
(defcustom thwap-development nil
	"Whether or not to enable development assistance packages."
	:type '(set (const :tag "none" nil)
							(const :tag "lsp" lspmode) ;; generally required for other modes
							(const :tag "magit" magitmode) ;; git integration
							(const :tag "magit forge" magitforge) ;; git forge integration
							(const :tag "magit todos" magittodos) ;; git todos integration
							(const :tag "projectile" projectilemode) ;; project management
							(const :tag "copilot" copilotmode) ;; code completion
							(const :tag "go" gomode) ;; go language support
							(const :tag "python" pythonmode) ;; python language support
							(const :tag "elpy" elpymode) ;; python language support (elpy)							
							(const :tag "terraform" terraformmode) ;; terraform language support
							(const :tag "yaml" yamlmode)) ;; yaml language support
	:group 'thwap-config)

(defcustom thwap-development-forge nil
	"Whether or not to enable a directory browser."
	:type '(choice (const :tag "none" nil)
								 (const :tag "github" githubforge)
								 (const :tag "gitlab" gitlabforge))
	:group 'thwap-config)

(defcustom thwap-development-forge-key nil
	"API key for the chosen forge."
	:type 'string
	:group 'thwap-config)


;; lsp-mode
(when (memq 'lspmode thwap-development)
	(use-package lsp-mode
		:straight t
		:defer t)
	(use-package lsp-ui
		:straight t
		:defer t)
	(when (eq 'treemacs thwap-dirbrowser)
		(use-package lsp-treemacs
			:straight t
			:defer t))
	(setq gc-cons-threshold 100000000)
	(setq read-process-output-max (* 1024 1024))
	(thwap/add-key-binding "l" 'lsp-keymap-prefix "lsp-keymap-prefix")
	(use-package eglot
		:straight t
		:defer t
		:config
		(require 'eglot))
	(message "lsp-mode loaded"))

;; magit
(when (memq 'magitmode thwap-development)
	(use-package magit
		:straight t
		:defer t)
	(when (memq 'magitforge thwap-development)
		(use-package forge
			:straight t
			:defer t
			:after magit))
	(when (memq 'magittodos thwap-development)
		(use-package magit-todos
			:straight t
			:defer t
			:after magit
			:config
			(add-hook 'magit-mode-hook 'magit-todos-mode)))
	(thwap/add-key-binding "g s" 'magit-status "Git status (magit entrypoint)")
	(thwap/add-key-binding "g l" 'magit-log "Git log (magit entrypoint")
	(thwap/add-key-binding "g b" 'magit-blame "Git blame (magit entrypoint")
	(thwap/add-key-binding "g f" 'magit-find-file "Git find file (magit entrypoint")
	(message "magit loaded"))

;; projectile
(when (memq 'projectilemode thwap-development)
	(use-package projectile
		:straight t
		:defer t
		:config
		(projectile-mode +1)
		(thwap/add-key-binding "p" 'projectile-command-map "Projectile commands"))
	(message "projectile loaded"))

;; co-pilot
(when (memq 'copilotmode thwap-development)
	(use-package dash
		:straight t
		:defer t)
	(use-package editorconfig
		:straight t
		:defer t)
	(use-package copilot
		:straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
		:defer t
		:ensure t
		:config
		;; you can utilize :map :hook and :config to customize copilot
		(add-hook 'prog-mode-hook 'copilot-mode)
		(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
		(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))
	(message "copilot loaded"))

;; go-mode
(when (memq 'gomode thwap-development)
	(use-package go-mode
		:straight t
		:defer t)
	(use-package go-eldoc
		:straight t
		:defer t)
	(use-package go-projectile
		:straight t
		:defer t)
	(use-package go-snippets
		:straight t
		:defer t)
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
		(use-package elpy
			:straight t
			:defer t
			:config
			(elpy-enable)))
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
	(use-package terraform-mode
		:straight t
		:defer t)
	(when (eq 'company thwap-completion)
		(use-package company-terraform
			:straight t
			:defer t
			:config
			(add-hook 'terraform-mode-hook #'company-terraform-init))
		(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
		(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))
	(message "terraform-mode loaded"))

;; yaml-mode
(when (memq 'yamlmode thwap-development)
	(use-package yaml-mode
		:straight t
		:defer t
		:config
		(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
		(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
		;; yaml-mode is a bit too aggressive with its indentation
		;; so we'll disable it and use the default
		(add-hook 'yaml-mode-hook
							(lambda ()
								(setq-local electric-indent-inhibit t)
								(setq-local electric-layout-rules nil))))
	(message "yaml-mode loaded"))


(message "T.H.W.A.P. development assistance packages loaded")
(provide 'thwap-development)
;; thwap-development.el ends here
