
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
	(use-package modus-themes
		:straight t
		:demand t
		:config
		(require 'modus-themes))
	(message "Modus themes loaded."))

(when (memq 'doomthemes thwap-ui-themes)
	(use-package doom-themes
		:straight t
		:demand t
		:config
		(require 'doom-themes))
	(message "Doom themes loaded."))

(when (memq 'sublimethemes thwap-ui-themes)
	(use-package sublime-themes
		:straight t
		:demand t
		:config
		(require 'sublime-themes))
	(message "Sublime themes loaded."))

(when (memq 'kaolinthemes thwap-ui-themes)
	(use-package kaolin-themes
		:straight t
		:demand t
		:config
		(require 'kaolin-themes))
	(message "Kaolin themes loaded."))

(when (memq 'alectthems thwap-ui-themes)
	(use-package alect-themes
		:straight t
		:demand t
		:config
		(require 'alect-themes))
	(message "Alect themes loaded."))

;; load the theme specified in the config if it is set
;; if things look wonky, you probably either need to install the
;; theme or you need to check your spelling.
(if thwap-ui-theme
			(load-theme thwap-ui-theme :no-confirm)
			(message "Theme loaded: %s" thwap-ui-theme))

;; icon bits

(when (and (eq 'alltheicons thwap-ui-icons) (not (eq 'nerdicons thwap-ui-icons)))
	(use-package all-the-icons
		:ensure t
		:demand t
		:straight t
		:hook (dired-mode . all-the-icons-dired-mode))
	(use-package all-the-icons-completion
		:ensure t
		:straight t
		:demand t
		:init
		(all-the-icons-completion-mode 1))
	(message "All-the-icons loaded."))

(when (and (eq 'nerdicons thwap-ui-icons) (not (eq 'alltheicons thwap-ui-icons)))
	(use-package nerd-icons
		:demand t
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
		)
	(message "Nerd-icons loaded."))

(when (and (eq 'nerdicons thwap-ui-icons) (eq 'alltheicons thwap-ui-icons))
	(message "Both all-the-icons and nerd-icons are enabled. Disabling nerd-icons.")
	(use-package all-the-icons-dired
		:ensure t
		:demand t
		:straight t
		:hook (dired-mode . all-the-icons-dired-mode))
	(use-package all-the-icons-completion
		:ensure t
		:straight t
		:demand t
		:init
		(all-the-icons-completion-mode 1))
	(message "All-the-icons loaded."))

;; Set the default font for the current frame and all new frames
(set-frame-font "Noto Sans Mono-9:weight=normal:width=normal" nil t)
(add-to-list 'default-frame-alist '(font . "Noto Sans Mono-9:weight=normal:width=normal"))


(message "T.H.W.A.P. Interface settings loaded.")
(provide 'thwap-interface)
