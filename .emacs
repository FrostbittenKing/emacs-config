;; .emacs
;; melpa initialization
(add-to-list 'load-path "~/.emacs.d/config-init")
(load-library "init-emacs-cfg") ;; config to run melpa initialization

;; Automatically save and restore sessions
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-restore-eager 5
      desktop-restore-frames t
      )
(desktop-save-mode 1)

;; remove desktop after it's been read
(add-hook 'desktop-after-read-hook
	    '(lambda ()
	            ;; desktop-remove clears desktop-dirname
	            (setq desktop-dirname-tmp desktop-dirname)
		         (desktop-remove)
			      (setq desktop-dirname desktop-dirname-tmp)))

(defun saved-session ()
  (file-exists-p (concat desktop-dirname "/" desktop-base-file-name)))

;; use session-restore to restore the desktop manually
(defun session-restore ()
  "Restore a saved emacs session."
  (interactive)
  (if (saved-session)
      (desktop-read)
    (message "No desktop found.")))

;; use session-save to save the desktop manually
(defun session-save ()
  "Save an emacs session."
  (interactive)
  (if (saved-session)
      (if (y-or-n-p "Overwrite existing desktop? ")
	    (desktop-save-in-desktop-dir)
	(message "Session not saved."))
  (desktop-save-in-desktop-dir)))

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)
;(add-to-list 'load-path "~/git-emacs")
;(require 'git-emacs)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anything-show-completion-activate t)
 '(backup-by-copying-when-linked t)
 '(git-state-modeline-decoration (quote git-state-decoration-large-dot))
 '(global-font-lock-mode t)
 '(inhibit-startup-screen t)
 '(safe-local-variable-values
   (quote
    ((predictive-mode . 0)
     (ispell-dictionary . "german"))))
 '(semantic-c-dependency-system-include-path
   (quote
    ("/usr/include" "/tmp/DPO_GPL_RT5592STA_LinuxSTA_v2.6.0.0_20120326/include"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default ispell-program-name "aspell")

;; Duplicate it
(defun duplicate()
 "Duplicate it."
 (interactive)
 (let (
       (beg (line-beginning-position))
       (end (line-end-position)))
   (copy-region-as-kill beg end)
   (beginning-of-line)
   (forward-line 1)
   (yank)
   (newline)
   (forward-line -1)))

(global-set-key "\C-cd" 'duplicate)

;; load paths
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/c")
(add-to-list 'load-path "~/.emacs.d/latex")
(add-to-list 'load-path "~/.emacs.d/ruby")
(add-to-list 'load-path "~/.emacs.d/markdown")
(add-to-list 'load-path "~/.emacs.d/haml")
(add-to-list 'load-path "~/.emacs.d/plugins/rcodetools")

;(add-to-list 'load-path "~/.emacs.d/plugins/ruby-electric")
(add-to-list 'load-path "~/.emacs.d/plugins/yari-with-buttons")

(add-to-list 'load-path "/usr/share/emacs/site-lisp/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "/usr/share/emacs/site-lisp/haskell-mode/")

;; load libs
;; NOT NEEDED
(load "install-elisp.el" nil t t)

;; TEMP COMMENTED OUT
;; probably possible to move to the rubyconfig
;(require 'ruby-electric)
;; rsense
;; (setq rsense-home "$RSENSE_HOME")
;; (add-to-list 'load-path (concat rsense-home "/etc"))

;;(require 'anything)
;;(require 'anything-show-completion)

(require 'yari)

;; setup yas
;; in theory this shouldn't be needed
(require 'yasnippet)
;;(setq yas-snippet-dirs (cons "~/.emacs.d/snippets/yasnippet-snippets/" yas-snippet-dirs))

;; global programming mode
(defun coding ()
  (yas-reload-all)
  (yas-minor-mode 1)
  (linum-mode)
  )

;; C++ Mode
(defun c_coding ()
  (load-library "ccfg")
  )

;; Latex Mode
(defun latex_docs ()
  (load-library "latexcfg")
)

;; Ruby Mode
(defun ruby_coding ()
;  (local-set-key "TAB" 'ac-complete-rsense)
  (load-library "rubycfg")
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  )
; markdown
(defun markdown_editing ()
  (coding)
  (load-library "markdowncfg")
  )
; haml
(defun haml_coding ()
  (load-library "hamlcfg")
)
;; setup auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-set-trigger-key "TAB")

;; install hooks
;; global programming mode
(add-hook 'prog-mode-hook 'coding)
(add-hook 'emacs-lisp-mode-hook (lambda ()
 				  (ac-config-default)))
(add-hook 'c-mode-common-hook 'c_coding)
(add-hook 'LaTeX-mode-hook 'latex_docs)
(add-hook 'ruby-mode-hook 'ruby_coding)
(add-hook 'markdown-mode-hook 'markdown_editing)
(add-hook 'haml-mode-hook 'haml_coding)

(add-hook 'feature-mode-hook (lambda () 
			       ))
(add-hook 'after-init-hook
          '(lambda () (setq debug-on-error t)
	     )
	  )

(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))
(setq debug-on-error t)
(put 'upcase-region 'disabled nil)
