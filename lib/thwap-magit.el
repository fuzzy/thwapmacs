
(straight-use-package 'magit)

;; Enable magit forge
(straight-use-package 'forge)

;; Enable magit-todos
(straight-use-package 'magit-todos)

;; Magit stuff
(define-key thwap-map (kbd "g s") 'magit-status)
(add-to-list 'thwap-help-lines "C-c t g s   : magit-status")

(provide 'thwap-magit)
