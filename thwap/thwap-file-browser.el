
;;
;; Tree browser packages
;;

(defcustom thwap-dirbrowser nil
	"Choose which directory browser to use."
	:type '(choice (const :tag "dired" dired)
								 (const :tag "neotree" neotree)
								 (const :tag "treemacs" treemacs))
	:group 'thwap-config)


;;
;; File Tree Browser
;;

;; TODO dired bindings

(when (eq 'neotree thwap-dirbrowser)
	(use-package neotree
		:straight t
		:ensure t
		:defer t
		:config
		(global-set-key [f8] 'neotree-toggle)
		(thwap/add-key-binding "C-t" 'neotree-toggle "Toggle Neotree"))
	(message "neotree loaded"))


(when (eq 'treemacs thwap-dirbrowser)
	(use-package treemacs
		:straight t
		:ensure t
		:defer t
		:config
		(global-set-key [f8] 'treemacs)
		(progn
			(setq treemacs-follow-after-init t
						treemacs-width 35
						treemacs-indentation 2
						treemacs-git-integration t
						treemacs-collapse-dirs 3
						treemacs-silent-refresh t
						treemacs-change-root-without-asking t
						treemacs-sorting 'alphabetic-desc
						treemacs-show-hidden-files t
						treemacs-never-persist nil
						treemacs-is-never-other-window t
						treemacs-goto-tag-strategy 'refetch-index)))
	(thwap/add-key-binding "C-t" 'treemacs "Toggle Treemacs")
	(when (memq 'kaolinthemes thwap-ui-themes)
		(kaolin-treemacs-theme))
	(message "treemacs loaded"))

(message "T.H.W.A.P. Directory browser configuration loaded.")
(provide 'thwap-file-browser)
