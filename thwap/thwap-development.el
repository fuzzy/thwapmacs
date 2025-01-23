
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
							(const :tag "typescript" typescriptmode) ;; typescript language support
							(const :tag "nim" nimmode) ;; nim language support
							(const :tag "v-lang" vlangmode) ;; v language support
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
		:demand t)
	(use-package lsp-ui
		:straight t
		:demand t)
	(when (eq 'treemacs thwap-dirbrowser)
		(use-package lsp-treemacs
			:straight t
			:demand t))
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
	(add-to-list 'thwap-base-hydra-map '("g" "MaGit" 'thwap-magit-hydra/body))
	(setq thwap-magit-hydra-map '(("s" "Git status" 'magit-status)
																("l" "Git log" 'magit-log)
																("b" "Git blame" 'magit-blame)
																("f" "Git find file" 'magit-find-file)))
	(use-package magit
		:straight t
		:demand t)

	(thwap/add-key-binding "g s" 'magit-status "Git status (magit entrypoint)")
	(thwap/add-key-binding "g l" 'magit-log "Git log (magit entrypoint")
	(thwap/add-key-binding "g b" 'magit-blame "Git blame (magit entrypoint")
	(thwap/add-key-binding "g f" 'magit-find-file "Git find file (magit entrypoint")
	
	(when (memq 'magitforge thwap-development)
		(use-package forge
			:straight t
			:demand t
			:after magit)

		(add-to-list 'thwap-magit-hydra-map '("C-f" "Forge" 'thwap-forge-hydra/body))
		(setq thwap-forge-hydra-map '(("p" "Forge pull" 'forge-pull)
																	("a" "add repo" 'forge-add-repository)
																	("l" "list topics" 'forge-list-topics)))
		(thwap/add-key-binding "f p" 'forge-pull "Update local copy of forge data / Do initial setup")
		(thwap/add-key-binding "f a" 'forge-add-repository "Add current file's repository to magit+forge")
		(thwap/add-key-binding "f l" 'forge-list-topics "Show issues/pull requests"))
	
	(when (memq 'magittodos thwap-development)
		(use-package magit-todos
			:straight t
			:demand t
			:after magit
			:config
			(add-hook 'magit-mode-hook 'magit-todos-mode))
		(add-to-list 'thwap-magit-hydra-map '("t" "Git Todos" 'magit-todos-list))
		(thwap/add-key-binding "g t" 'magit-todos-list "List todos in current repository"))
	(message "magit loaded"))

;; projectile
(when (memq 'projectilemode thwap-development)
	(use-package projectile
		:straight t
		:demand t
		:config
		(projectile-mode +1)
		;; (setq projectile-completion-system 'ivy)
		(add-to-list 'thwap-base-hydra-map '("p" "Project" 'projectile-command-map))
		(thwap/add-key-binding "p" 'projectile-command-map "Projectile commands"))
	(message "projectile loaded"))

;; co-pilot
(when (memq 'copilotmode thwap-development)
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

;; nim-mode
(when (memq 'nimmode thwap-development)
	(use-package nim-mode
		:straight t
		:defer t)
	(message "nim-mode loaded"))

;; v-mode
(use-package v-mode
  :straight (v-mode
             :type git
             :host github
             :repo "damon-kwok/v-mode"
             :files ("tokens" "v-mode.el"))
  :config
  :bind-keymap
  ("M-z" . v-menu)
  ("<f6>" . v-menu)
  ("C-c C-f" . v-format-buffer)
  :mode ("\\(\\.v?v\\|\\.vsh\\)$" . 'v-mode))

;; terraform-mode
(when (memq 'terraformmode thwap-development)
	(use-package terraform-mode
		:straight t
		:config
		(setq terraform-format-on-save t
					terraform-indent-level 2)
		(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
		:defer t)
	(when (eq 'company thwap-completion)
		(use-package company-terraform
			:straight t
			:defer t
			:config
			(add-hook 'terraform-mode-hook #'company-terraform-init)))
	(message "terraform-mode loaded"))

;; typescript-mode
(when (memq 'typescriptmode thwap-development)
	(use-package typescript-mode
		:straight t
		:defer t
		:hook (typescript-mode-hook . turn-on-font-lock))
	(message "typescript-mode loaded"))


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
