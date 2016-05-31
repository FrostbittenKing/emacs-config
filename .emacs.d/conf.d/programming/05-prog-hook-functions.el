(defun my-after-init-hook()
  '(lambda () (setq debug-on-error t)
     )
  )

;; install hooks
;; requires a defun of the form <prog-lang-dir-name>-mode-hook-fun that gets automatically hooked by install-prog-hooks
;; we need to exclude c, because this is handled by a common c language hook
(install-hooks (enum-directories "~/.emacs.d/conf.d/programming" t (cons "c" '())))

;; global programming mode
(add-hook 'prog-mode-hook 'coding)
(add-hook 'emacs-lisp-mode-hook (lambda ()
;;				  (ac-config-default)
	  ))
(add-hook 'c-mode-common-hook 'c_coding)
(add-hook 'feature-mode-hook (lambda () 
			       ))
(add-hook 'after-init-hook 'my-after-init-hook)
