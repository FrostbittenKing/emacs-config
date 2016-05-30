(defun my-after-init-hook()
  '(lambda () (setq debug-on-error t)
     )
  )

(defun enum-directories(dir &optional filter filter-dirs)
  (setq dirs () )
  (dolist (element
	   ;; filter current and upper directory
	   (directory-files (expand-file-name dir) nil directory-files-no-dot-files-regexp))
    (when (car (file-attributes (expand-file-name element dir))) (setq dirs (cons element dirs)))
    )
  (when filter
    (dolist (element filter-dirs) (delete element dirs))
    )
  dirs
  )

(defun install-prog-hooks (hook-list)
  (dolist (lang
	   hook-list) (add-hook (intern (concat lang "-mode-hook")) (intern (concat lang "-mode-hook-fun"))      
				)
	   )
  )
;; install hooks
;; requires a defun of the form <prog-lang-dir-name>-mode-hook-fun that gets automatically hooked by install-prog-hooks
;; we need to exclude c, because this is handled by a common c language hook
(install-prog-hooks (enum-directories "~/.emacs.d/conf.d/programming" t (cons "c" '())))

;; global programming mode
(add-hook 'prog-mode-hook 'coding)
(add-hook 'emacs-lisp-mode-hook (lambda ()
;;				  (ac-config-default)
	  ))
(add-hook 'c-mode-common-hook 'c_coding)
(add-hook 'feature-mode-hook (lambda () 
			       ))
(add-hook 'after-init-hook 'my-after-init-hook)
