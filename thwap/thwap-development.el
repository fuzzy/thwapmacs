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
	(load-file "~/.emacs.d/thwap/development/thwap-lsp.el"))

;; magit
(when (memq 'magitmode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-magit.el"))

;; projectile
(when (memq 'projectilemode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-projectile.el"))

;; co-pilot
(when (memq 'copilotmode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-copilot.el"))

;; go-mode
(when (memq 'gomode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-go.el"))

;; python-mode
(when (memq 'pythonmode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-python.el"))

;; nim-mode
(when (memq 'nimmode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-nim.el"))

;; v-mode
(when (memq 'vlangmode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-v.el"))

;; terraform-mode
(when (memq 'terraformmode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-terraform.el"))

;; typescript-mode
(when (memq 'typescriptmode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-typescript.el"))

;; yaml-mode
(when (memq 'yamlmode thwap-development)
	(load-file "~/.emacs.d/thwap/development/thwap-yaml.el"))

(message "T.H.W.A.P. development assistance packages loaded")
(provide 'thwap-development)
;; thwap-development.el ends here
