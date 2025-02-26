(setq custom-init "~/.emacs.d/custom-init.el")

(unless (file-exists-p custom-init)
  (thwap/touch-file custom-init))
(load-file custom-init)

(setq custom-file "~/.emacs.d/emacs-custom.el")

(unless (file-exists-p custom-file)
  (thwap/touch-file custom-file))
(load custom-file)

;; thwap config
(require 'thwap-configuration)
;; thwap defaults
(require 'thwap-defaults)
;; theme configuration
(require 'thwap-interface)
;; file browser configuration
(require 'thwap-file-browser)
;; company configuration
(require 'thwap-completion)
;; development configuration
(require 'thwap-development)
;; llm configuration
(require 'thwap-llm)
;; org configuration
(require 'thwap-orgmode)

;; now that everything is loaded, let's load all the user configurations
(let ((user-config (thwap/list-files-with-extension "~/.emacs.d/thwap.d" "el")))
	(dolist (config user-config)
		(load-file config)))

;; dashboard
(require 'thwap-dashboard)
;; hydras
(require 'thwap-hydra)
