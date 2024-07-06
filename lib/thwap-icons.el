
(when (and thwap-ui-enable-all-the-icons (not thwap-ui-enable-nerd-icons))
	(use-package all-the-icons
		:ensure t
		:straight t
		:hook (dired-mode . all-the-icons-dired-mode))
	(use-package all-the-icons-completion
		:ensure t
		:straight t
		:defer
		:init
		(all-the-icons-completion-mode 1)))

(when (and thwap-ui-enable-nerd-icons (not thwap-ui-enable-all-the-icons))
	(use-package nerd-icons
		:straight (nerd-icons
							 :type git
							 :host github
							 :repo "rainstormstudio/nerd-icons.el"
							 :files (:defaults "data"))
		:custom
		;; The Nerd Font you want to use in GUI
		;; "Symbols Nerd Font Mono" is the default and is recommended
		;; but you can use any other Nerd Font if you want
		(nerd-icons-font-family "Symbols Nerd Font Mono")
		))

(when (and thwap-ui-enable-nerd-icons thwap-ui-enable-all-the-icons)
	(message "Both all-the-icons and nerd-icons are enabled. Disabling nerd-icons.")
	(use-package all-the-icons-dired
		:ensure t
		:straight t
		:hook (dired-mode . all-the-icons-dired-mode))
	(use-package all-the-icons-completion
		:ensure t
		:straight t
		:defer
		:init
		(all-the-icons-completion-mode 1)))

(provide 'thwap-icons)
