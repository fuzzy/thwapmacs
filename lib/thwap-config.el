;;
;; Define the custom variables for the T.H.W.A.P. Emacs configuration.
;;

;; define the group
(defgroup thwap-config-group nil
  "T.H.W.A.P. Emacs configuration group."
  :group 'convenience
  :prefix "thwap-")


;;
;; Theme and appearance settings
;;

;; modus themes toggle
(defcustom thwap-ui-enable-modus-themes nil
  "Whether or not to install the modus themes."
  :type 'boolean
  :group 'thwap-config-group)

;; doom themes toggle
(defcustom thwap-ui-enable-doom-themes nil
	"Whether or not to install the doom themes."
	:type 'boolean
	:group 'thwap-config-group)

;; sublime themes toggle
(defcustom thwap-ui-enable-sublime-themes nil
	"Whether or not to install the sublime themes."
	:type 'boolean
	:group 'thwap-config-group)

;; kaolin themes toggle
(defcustom thwap-ui-enable-kaolin-themes nil
	"Whether or not to install the kaolin themes."
	:type 'boolean
	:group 'thwap-config-group)

;; alect themes toggle
(defcustom thwap-ui-enable-alect-themes nil
	"Whether or not to install the alect themes."
	:type 'boolean
	:group 'thwap-config-group)

;; theme to load
(defcustom thwap-ui-theme 'wombat ;; 'modus-vivendi-tinted
  "Name of the theme to load."
  :type 'string
  :group 'thwap-config-group)

;; all-the-icons toggle
(defcustom thwap-ui-enable-all-the-icons nil
  "Whether or not to enable all-the-icons."
  :type 'boolean
  :group 'thwap-config-group)

;; nerd-icons toggle
(defcustom thwap-ui-enable-nerd-icons nil
	"Whether or not to enable nerd-icons."
	:type 'boolean
	:group 'thwap-config-group)


;;
;; Tree browser packages
;;

;; treemacs toggle
(defcustom thwap-fm-enable-treemacs nil
	"Whether or not to enable treemacs."
	:type 'boolean
	:group 'thwap-config-group)

;; neotree toggle
(defcustom thwap-fm-enable-neotree nil
	"Whether or not to enable neotree."
	:type 'boolean'
	:group 'thwap-config-group)


;;
;; Completion packages
;;

;; company toggle
(defcustom thwap-comp-enable-company nil
	"Whether or not to enable company."
	:type 'boolean
	:group 'thwap-config-group)

;; auto-complete toggle
(defcustom thwap-comp-enable-auto-complete nil
	"Whether or not to enable auto-complete."
	:type 'boolean
	:group 'thwap-config-group)


;;
;; Language server packages
;;

;; lsp toggle
(defcustom thwap-comp-enable-lsp nil
	"Whether or not to enable lsp."
	:type 'boolean
	:group 'thwap-config-group)


;;
;; development assistance packages
;;

;; projectile toggle
(defcustom thwap-dev-enable-projectile nil
	"Whether or not to enable projectile."
	:type 'boolean
	:group 'thwap-config-group)

;; magit toggle
(defcustom thwap-dev-enable-magit nil
	"Whether or not to enable magit."
	:type 'boolean
	:group 'thwap-config-group)


;;
;; Org mode settings
;;
(defcustom thwap-org-enable-org nil
	"Whether or not to enable org-mode."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-org-bullets nil
	"Whether or not to enable org-bullets."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-org-super-agenda nil
	"Whether or not to enable org-super-agenda."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-org-modern nil
	"Whether or not to enable org-modern."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-org-timeblock nil
	"Whether or not to enable org-timeblock."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-org-download nil
	"Whether or not to enable org-download."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-org-roam nil
	"Whether or not to enable org-roam."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-org-roam-ui nil
	"Whether or not to enable org-roam-ui."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-ob-mermaid nil
	"Whether or not to enable ob-mermaid."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-org-transclusion nil
	"Whether or not to enable org-transclusion."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-enable-org-ai nil
	"Whether or not to enable org-ai."
	:type 'boolean
	:group 'thwap-config-group)

(defcustom thwap-org-openai-api-token nil
	"OpenAI API Token for use in org-ai."
	:type 'string
	:group 'thwap-config-group)

;;
;; Example usage
;;

;; Example usage
(defun my-custom-function ()
  "Function that uses the custom variables."
  (message "Custom variable 1: %s" thwap-config-enable-modus-themes)
  (message "Custom variable 2: %s" thwap-config-theme)
  (message "Custom variable 3: %s" thwap-config-enable-alltheicons))


;; our provide statement
(provide 'thwap-config)
