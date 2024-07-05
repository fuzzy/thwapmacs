
;;
;; Ensure Org mode is installed and loaded
;;

;; base
(straight-use-package 'org)
;; functionality / configuration
(straight-use-package 'org-bullets)
(straight-use-package 'org-modern)
(straight-use-package 'org-super-agenda)
(straight-use-package 'org-timeblock)
;; content related packages
(straight-use-package 'org-download)
(straight-use-package 'ob-mermaid)
;; org-roam stuff
(straight-use-package 'org-roam)
(straight-use-package 'org-roam-ui)
(straight-use-package 'org-transclusion)

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

;; (defun thwap/list-files-with-extension (dir extension)
;;   "Recursively list all files in DIR with the given EXTENSION."
;;   (let ((files '()))
;;     (dolist (file (directory-files-recursively dir (concat "\\." extension "\\'")))
;;       (push file files))
;;     files))

(defun thwap/org-agenda-files-update ()
  "Update the org-agenda-files variable."
  (setq org-agenda-files (thwap/list-files-with-extension "~/.org-agenda" "org"))
  (setq org-timeblock-files (thwap/list-files-with-extension "~/.org-agenda" "org"))
  (setq org-timeblock-inbox-file "~/.org-agenda/tasks.org"))

;;
;; Org mode configuration
;;

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox-esr")

;; Basic Org mode settings
(setq org-log-done 'time
      org-startup-indented t
      org-hide-leading-stars t
      org-directory "~/.org-agenda"
      org-default-notes-file "~/.org-agenda/notes.org")

;; Configure Org agenda
(thwap/org-agenda-files-update)

;; Configure TODO keywords
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "EPIC" "WAITING" "WONTDO" "DONE")))

;; Set up capture templates
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

;; Configure Org export settings
(setq org-export-with-sub-superscripts t)
(setq org-export-with-toc t)

;; Enable Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (org . t)
   (ruby . t)
   (shell . t)))


;; Visual line mode for Org mode
(add-hook 'org-mode-hook 'thwap/org-agenda-files-update)
(add-hook 'org-mode-hook 'visual-line-mode)

;; org-bullets hooks
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Org mode stuff
(define-key thwap-map (kbd "o l") 'org-store-link)
(define-key thwap-map (kbd "o C-l") 'org-toggle-link-display)
;; agenda stuff
(define-key thwap-map (kbd "o n") 'org-capture)
(define-key thwap-map (kbd "o a") 'org-agenda)
(define-key thwap-map (kbd "o t") 'org-todo-list)
;; time management stuff
(define-key thwap-map (kbd "o c i") 'org-clock-in)
(define-key thwap-map (kbd "o c o") 'org-clock-out)
(define-key thwap-map (kbd "o c r") 'org-clock-report)
;; refile stuff
(define-key thwap-map (kbd "o r") 'org-refile)
;; export stuff
(define-key thwap-map (kbd "o e") 'org-export-dispatch)

(provide 'thwap-org)
