;; custom set stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(terraform-format-on-save t)
 '(terraform-indent-level 2)
 '(tool-bar-mode nil)
 '(visible-bell 1))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight regular :height 90 :width normal)))))

;; thwap config
(require 'thwap-config)
;; thwap defaults
(require 'thwap-defaults)
;; theme configuration
(require 'thwap-theme)
;; icon configuration
(require 'thwap-icons)
;; nerdtree configuration
(require 'thwap-nerdtree)
;; company configuration
(require 'thwap-comp)
;; LSP configuration
(require 'thwap-lsp)
;; Eglot configuration
(require 'thwap-eglot)
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
