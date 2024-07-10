
;;
;; Theme and appearance settings
;;

;; modus themes toggle
(defcustom thwap-ui-themes nil
  "Choose the themes to install."
  :type '(set (const :tag "Modus themes" modusthemes)
							(const :tag "Doom themes" doomthemes)
							(const :tag "Sublime themes" sublimethemes)
							(const :tag "Kaolin themes" kaolinthemes)
							(const :tag "Alect themes" alectthemes))
  :group 'thwap-config)

;; theme to load
(defcustom thwap-ui-theme 'wombat ;; 'modus-vivendi-tinted
  "Name of the theme to load."
  :type 'string
  :group 'thwap-config)

;; all-the-icons toggle
(defcustom thwap-ui-icons nil
  "Choose the icon sets to install."
  :type '(choice (const :tag "None" nil)
								 (const :tag "All-the-icons" alltheicons)
								 (const :tag "Nerd-icons" nerdicons))
  :group 'thwap-config)


;; theme bits

(when (memq 'modusthemes thwap-ui-themes)
	(straight-use-package 'modus-themes)
	(require 'modus-themes))

(when (memq 'doomthemes thwap-ui-themes)
	(straight-use-package 'doom-themes)
	(require 'doom-themes))

(when (memq 'sublimethemes thwap-ui-themes)
	(straight-use-package 'sublime-themes)
	(require 'sublime-themes))

(when (memq 'kaolinthemes thwap-ui-themes)
	(straight-use-package 'kaolin-themes)
	(require 'kaolin-themes))

(when (memq 'alectthems thwap-ui-themes)
	(straight-use-package 'alect-themes)
	(require 'alect-themes))

;; load the theme specified in the config
;; if things look wonky, you probably either need to install the
;; theme or you need to check your spelling.
(load-theme thwap-ui-theme :no-confirm)


;; icon bits

(when (and (eq 'alltheicons thwap-ui-icons) (not (eq 'nerdicons thwap-ui-icons)))
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

(when (and (eq 'nerdicons thwap-ui-icons) (not (eq 'alltheicons thwap-ui-icons)))
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

(when (and (eq 'nerdicons thwap-ui-icons) (eq 'alltheicons thwap-ui-icons))
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

(provide 'thwap-interface)
