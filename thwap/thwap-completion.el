
;;
;; Completion packages
;;

;; company toggle
(defcustom thwap-completion nil
	"Choose the completion framework to use."
	:type '(choice (const :tag "None" nil)
								 (const :tag "company" companycomp)
								 (const :tag "helm" helmcomp)
								 (const :tag "ivy" ivycomp))
	:group 'thwap-config)


;; Company and auto-complete configuration
(when (and (eq 'companycomp thwap-completion) (not (eq 'helmcomp thwap-completion)) (not (eq 'ivycomp thwap-completion)))
	(straight-use-package 'company)
	(add-hook 'after-init-hook 'global-company-mode))

;; If ivy is enabled, install and configure it
(when (and (eq 'ivycomp thwap-completion) (not (eq 'companycomp thwap-completion)) (not (eq 'helmcomp thwap-completion)))
	(straight-use-package 'ivy)
	(ivy-mode 1)
	(setq ivy-use-virtual-buffers t)
	(setq enable-recursive-minibuffers t))

;; If helm is enabled, install and configure it
(when (and (eq 'helmcomp thwap-completion) (not (eq 'companycomp thwap-completion)) (not (eq 'ivycomp thwap-completion)))
	(straight-use-package 'helm)
	(helm-mode 1))


;; If all are enabled, choose company
(when (or (and (eq 'companycomp thwap-completion) (eq 'helmcomp thwap-completion) (eq 'ivycomp thwap-completion))
					(and (eq 'companycomp thwap-completion) (eq 'helmcomp thwap-completion) (not (eq 'ivycomp thwap-completion)))
					(and (eq 'companycomp thwap-completion) (eq 'ivycomp thwap-completion) (not (eq 'helmcomp thwap-completion))))
	(message "All completion frameworks are enabled.  Choosing company.")
	(straight-use-package 'company)
	(add-hook 'after-init-hook 'global-company-mode))

;; if helm and ivy are enabled, choose ivy
(when (and (eq 'helmcomp thwap-completion) (eq 'ivycomp thwap-completion) (not (eq 'companycomp thwap-completion)))
	(message "Both helm and ivy are enabled.  Choosing ivy.")
	(straight-use-package 'ivy)
	(ivy-mode 1)
	(setq ivy-use-virtual-buffers t)
	(setq enable-recursive-minibuffers t))

(provide 'thwap-completion)

