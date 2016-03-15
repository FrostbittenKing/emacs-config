;; global programming mode
(defun coding ()
  ;; needed due to customized initialization
  (require 'yasnippet)
  ;;(setq yas-snippet-dirs (cons "~/.emacs.d/snippets/yasnippet-snippets/" yas-snippet-dirs))
  (yas-reload-all)   
  (yas-minor-mode 1)
  
  ;; setup auto-complete
  (require 'auto-complete-config)
  (setq ac-auto-start nil)
  (ac-set-trigger-key "TAB")
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (ac-config-default)
  
  (linum-mode)
  )

;; C++ Mode
(defun c_coding ()
  (load-library "ccfg")
  )

(defun my-after-init-hook()
  '(lambda () (setq debug-on-error t)
     )
  )


;; install hooks
(add-hook 'LaTeX-mode-hook 'latex_docs)
(add-hook 'ruby-mode-hook 'ruby_coding)
(add-hook 'markdown-mode-hook 'markdown_editing)
(add-hook 'haml-mode-hook 'haml_coding)
;; global programming mode
(add-hook 'prog-mode-hook 'coding)
(add-hook 'emacs-lisp-mode-hook (lambda ()
;;				  (ac-config-default)
	  ))
(add-hook 'c-mode-common-hook 'c_coding)
(add-hook 'feature-mode-hook (lambda () 
			       ))
(add-hook 'after-init-hook 'my-after-init-hook)
