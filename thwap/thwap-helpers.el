;;
;; Helper functions for the dashboard
;;

(defun thwap/dashboard-insert-logo-title (banner)
	"Insert BANNER into the dashboard buffer."
	(insert "\n")
	;; if banner is a single string, display it in the center
	;; else if it is a list of strings, display them with line breaks
	(if (stringp banner)
			(insert (propertize banner 'face 'dashboard-banner-logo-title))
		(dolist (line banner)
			(insert (propertize line 'face 'dashboard-banner-logo-title))
			(insert "\n"))))

(defun thwap/dashboard-build-logo-title (lst)
	"Build a list of strings from LST to display as the banner."
	(mapconcat 'identity (reverse lst) "\n"))

(defun thwap/random-string-from-list (strings)
  (let ((index (random (length strings))))
    (nth index strings)))

;;
;; Helper functions for general use
;;

;; Function to list all files in a directory with a given extension
(defun thwap/list-files-with-extension (dir extension)
  "Recursively list all files in DIR with the given EXTENSION, suitable for org-agenda-files."
  (let ((files '()))
    (dolist (file (directory-files-recursively dir (concat "\\." extension "\\'")))
      (push file files))
    (nreverse files)))

;;
;; Helper functions for org mode
;;

;; Function to get a unique filename for Org-capture
(defun thwap/org-capture-get-unique-filename ()
  "Generate a unique filename for Org-capture."
  (let ((filename (format "~/.org-agenda/syncup__issue__%s.org" (format-time-string "%Y%m%d%H%M%S"))))
    (message "Inside function: Generated filename: %s" filename)
    filename))

;; Function to update org-agenda-files
(defun thwap/org-agenda-files-update ()
  "Update the org-agenda-files variable."
  (setq org-agenda-files (thwap/list-files-with-extension "~/.org-agenda" "org"))
  (setq org-timeblock-files (thwap/list-files-with-extension "~/.org-agenda" "org"))
  (setq org-timeblock-inbox-file "~/.org-agenda/tasks.org"))


(provide 'thwap-helpers)
;;; thwap-helpers.el ends here
