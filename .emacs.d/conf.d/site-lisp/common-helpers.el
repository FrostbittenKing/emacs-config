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

(defun install-hooks (hook-list)
  (dolist (lang
	   hook-list) (add-hook (intern (concat lang "-mode-hook")) (intern (concat lang "-mode-hook-fun"))      
				)
	   )
  )
