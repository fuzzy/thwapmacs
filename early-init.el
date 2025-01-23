;;
;; Load paths
;;

;; Add the lib directory to the load path
(add-to-list 'load-path (expand-file-name "thwap" user-emacs-directory))

;; Add the thwap.d directory to the load path
(add-to-list 'load-path (expand-file-name "thwap.d" user-emacs-directory))

;; thwap helpers
(require 'thwap-helpers)

;;
;; Package management dependencies
;;

;; And disable package at startup
(setq package-enable-at-startup nil)


;;
;; Bootstrap package management with straight.el and use-package
;;

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Set up straight.el to use use-package
(straight-use-package 'use-package)

