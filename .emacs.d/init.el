;; .emacs
;; don't delete, or it will be added automatically again
;; (package-initialize)			

;; config to run melpa initialization
(add-to-list 'load-path "~/.emacs.d/conf.d/config-init")
(load-library "init-emacs-cfg")

(add-to-list 'load-path "~/.emacs.d/conf.d/site-lisp")
(load-library "install-elisp")
(load-library "my-site-start")
(load-library "common-helpers")
(load-library "copypaste")
;(autoload 'my-site-start "~/.emacs.d/my-site-start" nil t)
(my-site-start "~/.emacs.d/conf.d/")

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-babel-hyphen-language-alist (quote (("ngerman" "--" t))))
 '(anything-show-completion-activate t)
 '(backup-by-copying-when-linked t)
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(frame-background-mode (quote dark))
 '(git-state-modeline-decoration (quote git-state-decoration-large-dot))
 '(global-font-lock-mode t)
 '(graphviz-dot-view-command
   (concat "eog "
	   (concat
	    (shell-quote-argument
	     (file-name-base buffer-file-name))
	    ".png")))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (lua-mode color-theme-solarized gvpr-mode graphviz-dot-mode zenburn-theme yasnippet yari yaml-mode ruby-electric rubocop rsense pcre2el org-plus-contrib org noflet mouse+ markdown-toc markdown-mode+ latex-preview-pane hc-zenburn-theme haml-mode gitignore-mode flycheck feature-mode ecukes autopair auctex-latexmk arduino-mode anything ac-slime ac-nrepl ac-math ac-js2 ac-ispell ac-inf-ruby ac-helm ac-geiser ac-etags ac-emmet ac-dabbrev ac-c-headers)))
 '(safe-local-variable-values
   (quote
    ((Tex-Master . "../../thesis")
     (reftex-plug-into-AUCTeX . t)
     (TeX-auto-save . t)
     (TeX-debug-bad-boxes . t)
     (ispell-dictionary . "german")
     (TeX-parse-self . t)
     (predictive-mode . 0)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; load paths
;;(add-to-list 'load-path "~/.emacs.d/<foobar>")

; 
;;(require 'anything)
;;(require 'anything-show-completion)

;; init.el

(load-theme 'solarized t)
