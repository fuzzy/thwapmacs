(use-package typescript-mode
	:straight t
	:defer t
	:hook (typescript-mode-hook . turn-on-font-lock))

(message "typescript-mode loaded")
(provide 'thwap-typescript)
