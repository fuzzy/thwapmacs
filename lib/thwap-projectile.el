
(straight-use-package 'projectile)

;; Projectile keybindings
(define-key thwap-map (kbd "p") 'projectile-command-map)
(add-to-list 'thwap-help-lines "C-c t p     : Projectile commands")

(provide 'thwap-projectile)
