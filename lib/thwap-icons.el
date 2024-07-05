(use-package all-the-icons
  :ensure t
  :straight t)
;;  :if (display-graphic-p))

(use-package all-the-icons-completion
  :ensure t
  :straight t
  :defer
;;  :if (display-graphic-p)
  :init
  (all-the-icons-completion-mode 1))

(provide 'thwap-icons)
