;;
;; Org mode settings
;;

;; org layer toggles
(defcustom thwap-orgmode nil
	"Choose from the available org-mode packages"
	:type '(set	(const :tag "Org" orgmode)
							(const :tag "Org-Bullets" orgbullets)
							(const :tag "Org-SuperAgenda" orgsuperagenda)
							(const :tag "Org-Modern" orgmodern)
							(const :tag "Org-TimeBlock" orgtimeblock)
							(const :tag "Org-Download" orgdownload)
							(const :tag "Org-Transclusion" orgtransclusion)
							(const :tag "Org-Roam" orgroam)
							(const :tag "Org-Publish" orgpublish))
	:group 'thwap-config)

;; org-babel extras
(defcustom thwap-orgbabel nil
	"Choose extra packages for org-babel"
	:type '(set (const :tag "ob-mermaid" obmermaid)
							(const :tag "ob-napkin" obnapkin))
	:group 'thwap-config)

;;
;; Ensure Org mode is installed and loaded
;;

;; base
(when (memq 'orgmode thwap-orgmode)
	(use-package org
		:straight t
		:defer t
		:config
		(add-to-list 'thwap-base-hydra-map '("C-o" "Org Dashboard" thwap-org-hydra/body))
		(setq thwap-org-hydra-map '(("a" "Agenda" 'org-agenda)
																("c" "Capture" 'org-capture)
																("t" "List TODO" 'org-todo-list)
																("l" "Link" 'org-store-link)
																("r" "Refile" 'org-refile)
																("e" "Export" 'org-export-dispatch)
																("c" "Clock" 'thwap-org-clock-hydra/body)))
		(setq thwap-org-clock-hydra-map '(("i" "Clock" 'org-clock-in)
																			("o" "Out" 'org-clock-out)
																			("r" "Report" 'org-clock-report)
																			("c" "Cancel" 'org-clock-cancel)))
		(thwap/ensure-directory-exists "~/.org-agenda")
		(setq browse-url-browser-function 'browse-url-generic
					browse-url-generic-program "firefox-esr"
					org-log-done 'time
					org-startup-indented t
					org-hide-leading-stars t
					org-support-shift-select t
					org-directory "~/.org-agenda"
					org-default-notes-file "~/.org-agenda/notes.org"
					org-export-with-sub-superscripts t
					org-export-with-toc t)
		(thwap/org-agenda-files-update)
		(setq org-todo-keywords
					'((sequence "TODO(t)" "WAITING(w)" "BLOCKED(b)" "|" "IN-PROGRESS(i)")
						(sequence "WONTDO(o)" "DEPRECATED(e)" "STUPID(s)" "|" "DONE(d)")))
		(setq org-capture-templates
					`(("t" "TODO" entry (file+headline "~/.org-agenda/tasks.org" "Tasks")
						 "* TODO %?\n  %a")
						("l" "TODO" entry (file+headline "~/.org-agenda/tasks.org" "LIFE Tasks")
						 "* TODO %?\n  %i\n  %a")
						("a" "Appointment" entry (file+headline "~/.org-agenda/events.org" "Appointments")
						 "* %?\n  %i\n  %a" :clock-in t :clock-resume t)
						("e" "Schedule Event" entry (file+headline "~/.org-agenda/events.org" "Events")
						 "* %?\n  %i\n  %a" :clock-in t :clock-resume t)
						("m" "Schedule Meeting" entry (file+headline "~/.org-agenda/events.org" "Meetings")
						 "* %?\n  %i\n  %a" :clock-in t :clock-resume t)
						("n" "Note" entry (file "~/.org-agenda/notes.org")
						 "* %?\n  %i\n  %a" :clock-in t :clock-resume t)
						("i" "Idea" entry (file "~/.org-agenda/ideas.org")
						 "* %? :IDEA: \n%t" :clock-in t :clock-resume t)))
		(require 'ob-dot)
		(require 'ob-plantuml)
		(setq org-plantuml-jar-path (expand-file-name "/usr/local/share/java/plantuml/plantuml.jar"))
		(org-babel-do-load-languages
		 'org-babel-load-languages
		 '((abc . t)
			 (arduino . t)
			 (asymptote . t)
			 (awk . t)
			 (C . t)
			 (coq . t)
			 (cpp . t)
			 (calc . t)
			 (shell . t)
			 (clojure . t)
			 (comint . t)
			 (css . t)
			 (D . t)
			 (ditaa . t)
			 (ebnf . t)
			 (emacs-lisp . t)
			 (eshell . t)
			 (F90 . t)
			 (fomus . t)
			 (forth . t)
			 (gnuplot . t)
			 (hledger . t)
			 (mathmatica . t)
			 (mathomatic . t)
			 (csharp . t)
			 (vbnet . t)
			 (oz . t)
			 (mscgen . t)
			 (php . t)
			 (picolisp . t)
			 (redis . t)
			 (shen . t)
			 (spice . t)
			 (smiles . t)
			 (stan . t)
			 (stata . t)
			 (sclang . t)
			 (tcl . t)
			 (vala . t)
			 (eukleides . t)
			 (screen . t)
			 (sed . t)
			 (dot . t)
			 (haskell . t)
			 (java . t)
			 (julia . t)
			 (latex . t)
			 (ly . t)
			 (lisp . t)
			 (lua . t)
			 (makefile . t)
			 (matlab . t)
			 (max . t)
			 (js . t)
			 (ocaml . t)
			 (octave . t)
			 (org . t)
			 (perl . t)
			 (plantuml . t)
			 (processing . t)
			 (python . t)
			 (R . t)
			 (ruby . t)
			 (sass . t)
			 (scheme . t)
			 (sql . t)
			 (sqlite . t)))
		(add-hook 'org-mode-hook 'thwap/org-agenda-files-update)
		(add-hook 'org-mode-hook 'visual-line-mode)
		;; Org mode stuff
		(thwap/add-key-binding "o l" 'org-store-link "Store a link to the current location in the kill ring.")
		(thwap/add-key-binding "o C-l" 'org-toggle-link-display "Toggle the display of links.")
		(thwap/add-key-binding "o a" 'org-agenda "Open the Org agenda.")
		(thwap/add-key-binding "o n" 'org-capture "Capture a new task.")
		(thwap/add-key-binding "o t" 'org-todo-list "Open the Org TODO list.")
		(thwap/add-key-binding "o c i" 'org-clock-in "Clock in to the current task.")
		(thwap/add-key-binding "o c o" 'org-clock-out "Clock out of the current task.")
		(thwap/add-key-binding "o c r" 'org-clock-report "Generate a clock report.")
		(thwap/add-key-binding "o r" 'org-refile "Refile the current task.")
		(thwap/add-key-binding "o e" 'org-export-dispatch "Export the current buffer.")
		(message "org-mode loaded")))

;; org-bullets
(when (and (memq 'orgmode thwap-orgmode) (memq 'orgbullets thwap-orgmode))
	(use-package org-bullets
		:straight t
		:demand t
		:config
		(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
		(message "org-bullets loaded")))

;; org-super-agenda
(when (and (memq 'orgmode thwap-orgmode) (memq 'orgsuperagenda thwap-orgmode))
	(use-package org-super-agenda
		:straight t
		:defer t
		:config
		(add-hook 'org-agenda-mode-hook 'org-super-agenda-mode)
		(message "org-super-agenda loaded")))

;; org-modern
(when (and (memq 'orgmode thwap-orgmode) (memq 'orgmodern thwap-orgmode))
	(use-package org-modern
		:straight t
		:demand t
		:config
		(add-hook 'org-mode-hook 'org-modern-mode)
		(message "org-modern loaded")))

;; org-timeblock
(when (and (memq 'orgmode thwap-orgmode) (memq 'orgtimeblock thwap-orgmode))
	(use-package org-timeblock
		:straight t
		:defer t
		:config
		(add-hook 'org-mode-hook 'org-timeblock-mode)
		(message "org-timeblock loaded")))

;; org-download
(when (and (memq 'orgmode thwap-orgmode) (memq 'orgdownload thwap-orgmode))
	(use-package org-download
		:straight t
		:defer t
		:config
		(add-hook 'dired-mode-hook 'org-download-enable)
		(message "org-download loaded")))

;; org-roam
(when (and (memq 'orgmode thwap-orgmode) (memq 'orgroam thwap-orgmode))
	(use-package org-roam
		:straight t
		:defer t
		:config
		(add-hook 'org-mode-hook 'org-roam)
		(org-roam-db-autosync-mode)
		(thwap/ensure-directory-exists "~/.org-roam")
		(setq org-roam-v2-ack t)
		(setq org-roam-directory "~/.org-roam")
		(setq org-roam-db-location "~/.org-roam/org-roam.db")
		(setq org-roam-completion-everywhere t)
		(setq org-roam-capture-templates
					'(("d" "default" plain "%?"
					 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
					 :unnarrowed t)))))

;; org-publish
(when (and (memq 'orgmode thwap-orgmode) (memq 'orgpublish thwap-orgmode))
	(require 'ox-publish)
	(thwap/ensure-directory-exists "~/www/html/org")
	(thwap/ensure-directory-exists "~/.org")
	(setq org-publish-project-alist
      '(
				("org-notes"
				 :base-directory "~/.org/"
				 :base-extension "org"
				 :publishing-directory "~/www/html/org/"
				 :recursive t
				 :publishing-function org-html-publish-to-html
				 :headline-levels 4             ; Just the default for this project.
				 :auto-preamble t
				 )
				)))

;; ;; org-roam-ui
;; (when (and thwap-org-enable-org thwap-org-enable-org-roam thwap-org-enable-org-roam-ui)
;; 	(straight-use-package 'org-roam-ui)
;; 	(setq org-roam-ui-sync-theme t)
;; 	(setq org-roam-ui-follow t)
;; 	(setq org-roam-ui-update-on-save t))

;; org-transclusion
(when (and (memq 'orgmode thwap-orgmode) (memq 'orgtransclusion thwap-orgmode))
	(use-package org-transclusion
		:straight t
		:defer t
		:config
		(add-hook 'org-mode-hook 'org-transclusion-mode)
		(message "org-transclusion loaded")))

;; ob-mermaid
(when (and (memq 'orgmode thwap-orgmode) (memq 'obmermaid thwap-orgbabel))
	(use-package ob-mermaid
		:straight t
		:defer t
		:config
		(add-to-list 'org-src-lang-modes '("mermaid" . mermaid))
		(add-to-list 'org-babel-load-languages '(mermaid . t))
		(message "ob-mermaid loaded")))


(message "T.H.W.A.P. Org-Mode settings loaded")
(provide 'thwap-orgmode)
;; thwap-orgmode.el ends here
