
;; theme bits

(when thwap-ui-enable-modus-themes
	(straight-use-package 'modus-themes)
	(require 'modus-themes))

(when thwap-ui-enable-doom-themes
	(straight-use-package 'doom-themes)
	(require 'doom-themes))

(when thwap-ui-enable-sublime-themes
	(straight-use-package 'sublime-themes)
	(require 'sublime-themes))

(when thwap-ui-enable-kaolin-themes
	(straight-use-package 'kaolin-themes)
	(require 'kaolin-themes))

(when thwap-ui-enable-alect-themes
	(straight-use-package 'alect-themes)
	(require 'alect-themes))

;; load the theme specified in the config
;; if things look wonky, you probably either need to install the
;; theme or you need to check your spelling.
(load-theme thwap-ui-theme :no-confirm)

(provide 'thwap-theme)
