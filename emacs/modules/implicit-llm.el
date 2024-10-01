;;; llm integration


(use-package gptel)

(use-package ellama)

(use-package codeium
  :straight
  (codeium :type git
	   :host github
	   :repo "Exafunction/codeium.el"))

(use-package elysium
  :straight (elysium :type git
		     :host github
		     :repo "lanceberge/elysium"
		     :branch "main"
		     :files ("*.el"))
  :custom
  (elysium-window-size 0.33)
  (elysium-window-style 'vertical))

(provide 'implicit-llm)
