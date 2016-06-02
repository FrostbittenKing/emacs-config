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

(defun my-linum-mode ()
  (linum-mode)
  )

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
		     (count-lines (point-min) (point-max)))))
	 (linum-format (concat "%" (number-to-string w) "d\u2502")))
    ad-do-it))
