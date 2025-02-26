;; gptel
(defcustom thwap-llm-gptel-chatgpt-token nil
	"OpenAI API Key for GPTel (enables gptel)"
	:type 'string
	:group 'thwap-config)

;; org-ai
(defcustom thwap-org-openai-api-token nil
	"OpenAI API Token for use in org-ai. (Setting this enables the org-ai support.)"
	:type 'string
	:group 'thwap-config)


;; gptel
(when thwap-llm-gptel-chatgpt-token
	(use-package gptel
		:straight t
		:demand t
		:config
		(setq gptel-api-key thwap-llm-gptel-chatgpt-token)))

;; org-ai
(when thwap-org-openai-api-token
	(straight-use-package
	 '(org-ai :type git :host github :repo "rksm/org-ai"
						:local-repo "org-ai"
						:defer t
						:files ("*.el" "README.md" "snippets")))
	(setq org-ai-default-chat-model "gpt-4-turbo")
	(setq org-ai-openai-api-token thwap-org-openai-api-token)
	(org-ai-global-mode)
	(org-ai-install-yasnippets)
	(message "org-ai loaded"))

(message "T.H.W.A.P. LLM settings loaded")
(provide 'thwap-llm)
