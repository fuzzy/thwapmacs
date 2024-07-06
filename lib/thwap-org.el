;;
;; Helper functions
;;

;; Function to get a unique filename for Org-capture
(defun thwap/org-capture-get-unique-filename ()
  "Generate a unique filename for Org-capture."
  (let ((filename (format "~/.org-agenda/syncup__issue__%s.org" (format-time-string "%Y%m%d%H%M%S"))))
    (message "Inside function: Generated filename: %s" filename)
    filename))

(defun thwap/list-files-with-extension (dir extension)
  "Recursively list all files in DIR with the given EXTENSION, suitable for org-agenda-files."
  (let ((files '()))
    (dolist (file (directory-files-recursively dir (concat "\\." extension "\\'")))
      (push file files))
    (nreverse files)))

(defun thwap/org-agenda-files-update ()
  "Update the org-agenda-files variable."
  (setq org-agenda-files (thwap/list-files-with-extension "~/.org-agenda" "org"))
  (setq org-timeblock-files (thwap/list-files-with-extension "~/.org-agenda" "org"))
  (setq org-timeblock-inbox-file "~/.org-agenda/tasks.org"))


;;
;; Ensure Org mode is installed and loaded
;;

;; base
(when thwap-org-enable-org
	(straight-use-package 'org)
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
				'((sequence "TODO" "IN-PROGRESS" "EPIC" "WAITING" "WONTDO" "DONE")))
	(setq org-capture-templates
				`(("T" "THWAP TODO" entry (file+headline "~/.org-agenda/tasks.org" "THWAP Tasks")
					 "* TODO %?\n  %i\n  %a")
					("A" "APFM TODO" entry (file+headline "~/.org-agenda/tasks.org" "APFM Tasks")
					 "* TODO %?\n  %i\n  %a")
					("L" "LIFE TODO" entry (file+headline "~/.org-agenda/tasks.org" "LIFE Tasks")
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
	(org-babel-do-load-languages
	 'org-babel-load-languages
	 '((emacs-lisp . t)
		 (python . t)
		 (org . t)
		 (ruby . t)
		 (shell . t)))
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
	(thwap/add-key-binding "o e" 'org-export-dispatch "Export the current buffer."))

;; org-bullets
(when (and thwap-org-enable-org thwap-org-enable-org-bullets)
	(straight-use-package 'org-bullets)
	(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; org-super-agenda
(when (and thwap-org-enable-org thwap-org-enable-org-super-agenda)
	(straight-use-package 'org-super-agenda)
	(add-hook 'org-agenda-mode-hook 'org-super-agenda-mode))

;; org-modern
(when (and thwap-org-enable-org thwap-org-enable-org-modern)
	(straight-use-package 'org-modern))

;; org-timeblock
(when (and thwap-org-enable-org thwap-org-enable-org-timeblock)
	(straight-use-package 'org-timeblock))

;; org-download
(when (and thwap-org-enable-org thwap-org-enable-org-download)
	(add-hook 'dired-mode-hook 'org-download-enable))

;; ob-mermaid
(when (and thwap-org-enable-org thwap-org-enable-ob-mermaid)
	(straight-use-package 'ob-mermaid)
	(add-to-list 'org-src-lang-modes '("mermaid" . mermaid))
	(add-to-list 'org-babel-load-languages '(mermaid . t)))

;; org-roam
(when (and thwap-org-enable-org thwap-org-enable-org-roam)
	(setq org-roam-directory "~/.org-agenda")
	(setq org-roam-db-location "~/.org-agenda/org-roam.db")
	(setq org-roam-completion-everywhere t)
	(setq org-roam-capture-templates
				'(("d" "default" plain "%?"
					 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
					 :unnarrowed t)))
	(add-hook 'after-init-hook 'org-roam-mode)
	(add-hook 'org-mode-hook 'org-roam-mode)
	(add-hook 'org-mode-hook 'org-roam-ui-mode))

;; org-roam-ui
(when (and thwap-org-enable-org thwap-org-enable-org-roam thwap-org-enable-org-roam-ui)
	(straight-use-package 'org-roam-ui)
	(setq org-roam-ui-sync-theme t)
	(setq org-roam-ui-follow t)
	(setq org-roam-ui-update-on-save t))

;; org-transclusion
(when (and thwap-org-enable-org thwap-org-enable-org-transclusion)
	(straight-use-package 'org-transclusion))

;; org-ai
(when (and thwap-org-enable-org thwap-org-enable-org-ai)
	(straight-use-package
	 '(org-ai :type git :host github :repo "rksm/org-ai"
						:local-repo "org-ai"
						:files ("*.el" "README.md" "snippets")))
	(setq org-ai-default-chat-model "gpt-3.5-turbo")
	(setq org-ai-openai-api-token thwap-org-openai-api-token)
	(org-ai-global-mode)
	(org-ai-install-yasnippets))

;;
;; Org mode configuration
;;


(provide 'thwap-org)
