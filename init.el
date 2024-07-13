;; custom set stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mouse-autoselect-window t)
 '(mouse-drag-and-drop-region t)
 '(mouse-drag-and-drop-region-cross-program t)
 '(terraform-format-on-save t)
 '(terraform-indent-level 2)
 '(tool-bar-mode nil)
 '(visible-bell 1)
 '(xterm-mouse-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight regular :height 90 :width normal)))))

(setq custom-file "~/.emacs.d/emacs-custom.el")
(unless (file-exists-p custom-file)
  (shell-command (concat "touch " custom-file)))
(load custom-file)

;; thwap helpers
(require 'thwap-helpers)
;; thwap config
(require 'thwap-configuration)
;; thwap defaults
(require 'thwap-defaults)
;; theme configuration
(require 'thwap-interface)
;; file browser configuration
(require 'thwap-file-browser)
;; company configuration
(require 'thwap-completion)
;; development configuration
(require 'thwap-development)
;; org configuration
(require 'thwap-orgmode)
;; dashboard
(require 'thwap-dashboard)

;; now that everything is loaded, let's load all the user configurations
(let ((user-config (thwap/list-files-with-extension "~/.emacs.d/thwap.d" "el")))
	(dolist (config user-config)
		(load-file config)))
