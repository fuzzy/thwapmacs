
;; magit hydra
(when (memq 'magitmode thwap-development)
	(thwap/create-hydra-menu 'thwap-magit-hydra "Magit Menu" thwap-magit-hydra-map)
	;; magit forge hydra
	(when (memq 'magitforge thwap-development)
		(thwap/create-hydra-menu 'thwap-forge-hydra "Magit Forge Menu" thwap-forge-hydra-map)))

;; org hydra
(when (memq 'orgmode thwap-orgmode)
	(thwap/create-hydra-menu 'thwap-org-hydra "Org Menu" thwap-org-hydra-map)
	(thwap/create-hydra-menu 'thwap-org-clock-hydra "Org Clock Menu" thwap-org-clock-hydra-map))

;; yasnippet hydra
(thwap/create-hydra-menu 'thwap-yasnippet-hydra "Yasnippet Menu" thwap-yasnippet-hydra-map)

;; our base hydra
(thwap/create-hydra-menu 'thwap-base-hydra "Base Command Menu" thwap-base-hydra-map)

(global-set-key (kbd "C-c C-t") 'thwap-base-hydra/body)

(message "T.H.W.A.P. - Hydras loaded")
(provide 'thwap-hydra)
