;;;; c/c++ cfg

;; WORKAROUND FOR YAS
(defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
(defalias 'yas/table-hash 'yas--table-hash)
;; END WORKAROUND

(defun cedet-commands ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-j" 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-cj" 'semantic-complete-jump-local)
  (local-set-key "\C-cJ" 'semantic-complete-jump)
  (local-set-key "\C-cf" 'semantic-ia-fast-jump)
  (local-set-key "\C-cw" 'semantic-symref)
  (local-set-key "\C-cW" 'semantic-symref-symbol)
  (local-set-key (kbd "C-c <left>") 'semantic-tag-folding-fold-block)
  (local-set-key (kbd "C-c <right>") 'semantic-tag-folding-show-block)
  )

(defun cedet-self-insert ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
;  (local-set-key "::" 'semantic-complete-self-insert)
)

;; Function to load all include files in the specified directory
(defun DE-imply-includes-in-directory (dir)
  "Add all header files in DIR to `semanticdb-implied-include-tags'."
  (let ((files (directory-files dir t "^.+\\.h[hp]*$" t)))
    (defvar-mode-local c++-mode semanticdb-implied-include-tags
      (mapcar (lambda (header)
		(semantic-tag-new-include
		 header
		 nil
		 :filename header))
	      files))))


(defun c_coding ()
(semantic-mode 1)
(global-ede-mode 1)                      ; Enable the Project management system
;;NOT NEEDED
;;(semantic-load-enable-excessive-code-helpers)      ; Enable prototype help and smart completion 
;;(semantic-load-enable-code-helpers)
;; END NOT NEEDED

;(global-srecode-minor-mode 1)            ; Enable template insertion menu
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
;;(semantic-load-enable-primary-exuberent-ctags-support)
;(semantic-idle-completions-mode 1)
;  (setq-mode-local c-mode semanticdb-find-default-throttle '(project unloaded system recursive))
;  (setq-mode-local c++-mode semanticdb-find-default-throttle '(project unloaded system recursive))
;  (global-semantic-tag-folding-mode 1)

;  (semantic-tag-folding-mode 
;(DE-imply-includes-in-directory (concat wx-base-dir "/wx/gtk")) 

(local-set-key (kbd "RET") 'newline-and-indent)

(cedet-commands)
(cedet-self-insert)

(add-to-list 'ac-sources 'ac-source-semantic)
(setq ac-auto-start nil)

;; semantic config
(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-stickyfunc-mode)
(global-semantic-show-unmatched-syntax-mode t)
)
