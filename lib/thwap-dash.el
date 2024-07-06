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

(straight-use-package 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-banner-logo-title (thwap/dashboard-build-logo-title thwap-help-lines))
;; "Welcome to the T.H.W.A.P. Emacs Dashboard")
(setq dashboard-startup-banner (thwap/random-string-from-list (thwap/list-files-with-extension "~/.emacs.d/logos" "png")))
(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)
(setq dashboard-show-shortcuts t)
(setq dashboard-items '((agenda . 7)))
(setq dashboard-startupify-list '(dashboard-insert-banner
                                  dashboard-insert-newline
                                  dashboard-insert-banner-title
                                  dashboard-insert-newline
                                  dashboard-insert-navigator
                                  dashboard-insert-newline
                                  dashboard-insert-init-info
                                  dashboard-insert-items
                                  dashboard-insert-newline
                                  dashboard-insert-footer))

(provide 'thwap-dash)
