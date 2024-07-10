
;;
;; Set some defaults
;;

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
(straight-use-package 'golden-ratio)
(golden-ratio-mode 1)
(setq golden-ratio-auto-scale t)
(message "Golden Ratio Mode Enabled")

;;
;; Set up the T.H.W.A.P. keybindings
;;

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

(straight-use-package 'yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(message "Yasnippet loaded")

(straight-use-package 'yasnippet-snippets)
(require 'yasnippet-snippets)
(yas-reload-all)
(yas-global-mode 1)
(message "Yasnippet-Snippets loaded")

;; yasnippet stuff
(thwap/add-key-binding "y n" 'yas-new-snippet "Create a new yasnippet")

(message "T.H.W.A.P. Defaults Loaded")
;; our provide statement
(provide 'thwap-defaults)
