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
  (my-linum-mode)
  )
