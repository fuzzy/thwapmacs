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

;; Set the default help lines
(setq thwap-help-lines '("--------------"
												 "All T.H.W.A.P. commands will start with 'C-c t'"
												 ""
												 "Welcome to the T.H.W.A.P. Emacs Dashboard"))

;; thwap defaults
(require 'thwap-defaults)
;; theme configuration
(require 'thwap-theme)
;; icon configuration
(require 'thwap-icons)
;; nerdtree configuration
(require 'thwap-nerdtree)
;; company configuration
(require 'thwap-co)
;; LSP configuration
(require 'thwap-lsp)
;; projectile configuration
(require 'thwap-projectile)
;; magit configuration
(require 'thwap-magit)
;; CoPilot configuration
(require 'thwap-copilot)
;; org configuration
(require 'thwap-org)
;; golang configuration
(require 'thwap-go)
;; terraform configuration
(require 'thwap-tf)
;; python configuration
(require 'thwap-py)
;; yaml configuration
(require 'thwap-yaml)
;; yasnippet configuration
(require 'thwap-yas)
;; dashboard
(require 'thwap-dash)
