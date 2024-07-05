;; Add our custom site dir
(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "thwap.d" user-emacs-directory))

;; bootstrap straight, which we will use for everything

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

;; custom set stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight regular :height 90 :width normal)))))

(global-auto-revert-mode t)
(global-display-line-numbers-mode 1)
(setq warning-minimum-level :error)
(setq-default tab-width 2
              mode-line-format
              '("%e"
                mode-line-buffer-identification " "
                mode-line-modified " "
                mode-line-frame-identification " "
                mode-line-mode))
(setq tab-width 2)
(setq indent-tabs-mode 1)

;; The T.H.W.A.P. Map
;; This is the base starting point for the T.H.W.A.P. keybindings
(define-prefix-command 'thwap-map)
(global-set-key (kbd "C-t") 'thwap-map)

;; theme configuration

(require 'thwap-theme)

;; company configuration

(require 'thwap-co)

;; LSP configuration

(require 'thwap-lsp)

;; org configuration

(require 'thwap-org)

;; golang configuration

(require 'thwap-go)
