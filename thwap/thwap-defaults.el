
;;
;; Set some defaults
;;

;; mouse interaction options
(setq mouse-autoselect-window t
			mouse-drag-and-drop-region t
			mouse-drag-and-drop-region-cross-program t)
(xterm-mouse-mode 1)

;; toolbar and visual bell
(when (display-graphic-p)
	(tool-bar-mode -1))
(setq	visible-bell 1)

;; store our auth info in an encrypted file
(setq auth-sources '("~/.authinfo.gpg"))

;; automatically revert buffers when they change on disk
(global-auto-revert-mode t)

;; display line numbers, TODO make this a config option for line number style
(global-display-line-numbers-mode 1)

;; set our default warning level to error
(setq warning-minimum-level :error)

;; set the default tab width to 2 spaces
(setq-default tab-width 2)
(setq tab-width 2)
(setq indent-tabs-mode 1)

;; Set the default help lines
(setq thwap-help-lines '("--------------"
												 "All T.H.W.A.P. commands will start with 'C-c t'"
												 ""
												 "Welcome to the T.H.W.A.P. Emacs Dashboard"))


;;
;; Golden Ratio Mode helps with window sizing, and is a default feature
;;

;; golden-ratio
(use-package golden-ratio
	:straight t
	:demand t
	:config
	(golden-ratio-mode 1)
	(setq golden-ratio-auto-scale t))
(message "Golden Ratio Mode Enabled")

;;
;; Set up the T.H.W.A.P. keybindings and hydra
;;

(use-package hydra
	:straight t
	:demand t)

;; The T.H.W.A.P. Map
;; This is the base starting point for the T.H.W.A.P. keybindings
(define-prefix-command 'thwap-map)
(global-set-key (kbd "C-c t") 'thwap-map)

;; Add a command to customize the T.H.W.A.P. group
(thwap/add-key-binding
 "C-c"
 (lambda () (interactive) (customize-group 'thwap-config))
 "Customize this T.H.W.A.P. Emacs Installation")

;; quick commenting/uncommenting of a region is just too useful
(thwap/add-key-binding "c" 'comment-or-uncomment-region "Comment or uncomment region")

;; eval buffer is also very useful
(thwap/add-key-binding "e b" 'eval-buffer "Eval buffer")

(setq thwap-yasnippet-hydra-map '(("n" "New Snippet" 'yas-new-snippet)
																	("r" "Reload Snippets" 'yas-reload-all)
																	("l" "Load Snippets" 'yas-load-directory)))

(setq thwap-base-hydra-map '(("C-c" "Config Customizer" (lambda () (interactive) (customize-group 'thwap-config)))
															("c" "(Un)Comment Region" 'comment-or-uncomment-region)
															("e" "Eval Buffer" 'eval-buffer)
															("C-t" "Toggle Treemacs" '(lambda () (interactive) (treemacs)))
															("y" "YaSnippet Menu" 'thwap-yasnippet-hydra/body)))

	
(use-package yasnippet
	:straight t
	:demand t
	:config
	(require 'yasnippet)
	(setq yas-snippet-dirs '("~/.emacs.d/snippets")))
(message "Yasnippet loaded")

(use-package yasnippet-snippets
	:straight t
	:defer t
	:config
	(require 'yasnippet-snippets)
	(yas-reload-all)
	(yas-global-mode 1))
(message "Yasnippet-Snippets loaded")

;; yasnippet stuff
(thwap/add-key-binding "y n" 'yas-new-snippet "Create a new yasnippet")

(setq truncate-lines nil)

(message "T.H.W.A.P. Defaults Loaded")
;; our provide statement
(provide 'thwap-defaults)
