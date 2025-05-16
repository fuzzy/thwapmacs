;;
;; Define the custom variables for the T.H.W.A.P. Emacs configuration.
;;

;; define the group
(defgroup thwap-config nil
	"T.H.W.A.P. Emacs configuration group."
  :group 'convenience
  :prefix "thwap-")

;; Force Emacs to use the built-in project.el
(setq straight-built-in-pseudo-packages '(project xref))

; (global-font-lock-mode 1)

(message "T.H.W.A.P. Loaded thwap-config group.")
(provide 'thwap-configuration)
