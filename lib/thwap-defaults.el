


;; golden-ratio
(straight-use-package 'golden-ratio)
(golden-ratio-mode 1)
(setq golden-ratio-auto-scale t)

;; The T.H.W.A.P. Map
;; This is the base starting point for the T.H.W.A.P. keybindings
(define-prefix-command 'thwap-map)
(global-set-key (kbd "C-c t") 'thwap-map)

;; General emacs stuff
(define-key thwap-map (kbd "c") 'comment-or-uncomment-region)
(add-to-list 'thwap-help-lines "C-c t c     : Comment or uncomment region")

(define-key thwap-map (kbd "e b") 'eval-buffer)
(add-to-list 'thwap-help-lines "C-c t e b   : Eval buffer")

(provide 'thwap-defaults)
