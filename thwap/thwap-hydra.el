
;; magit hydra
(when (memq 'magitmode thwap-development)
	(thwap/create-hydra-menu 'thwap-magit-hydra "Magit Menu" thwap-magit-hydra-map)
	;; magit forge hydra
	(when (memq 'magitforge thwap-development)
		(thwap/create-hydra-menu 'thwap-forge-hydra "Magit Forge Menu" thwap-forge-hydra-map)))

;; yasnippet hydra
(thwap/create-hydra-menu 'thwap-yasnippet-hydra "Yasnippet Menu" thwap-yasnippet-hydra-map)

;; our base hydra
(thwap/create-hydra-menu 'thwap-base-hydra "Base Command Menu" thwap-base-hydra-map)

(global-set-key (kbd "C-c C-t") 'thwap-base-hydra/body)

(message "T.H.W.A.P. - Hydras loaded")
(provide 'thwap-hydra)
