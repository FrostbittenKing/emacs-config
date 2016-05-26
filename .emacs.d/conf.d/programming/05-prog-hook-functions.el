(defun my-after-init-hook()
  '(lambda () (setq debug-on-error t)
     )
  )


;; install hooks
(add-hook 'LaTeX-mode-hook 'latex_docs)
(add-hook 'ruby-mode-hook 'ruby_coding)
(add-hook 'markdown-mode-hook 'markdown_editing)
(add-hook 'haml-mode-hook 'haml_coding)
(add-hook 'yaml-mode-hook 'yaml_coding)
;; global programming mode
(add-hook 'prog-mode-hook 'coding)
(add-hook 'emacs-lisp-mode-hook (lambda ()
;;				  (ac-config-default)
	  ))
(add-hook 'c-mode-common-hook 'c_coding)
(add-hook 'feature-mode-hook (lambda () 
			       ))
(add-hook 'after-init-hook 'my-after-init-hook)
