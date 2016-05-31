;; .emacs

;; config to run melpa initialization
(add-to-list 'load-path "~/.emacs.d/conf.d/config-init")
(load-library "init-emacs-cfg")

(add-to-list 'load-path "~/.emacs.d/conf.d/site-lisp")
(load-library "install-elisp")
(load-library "my-site-start")
(load-library "common-helpers")
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
 '(anything-show-completion-activate t)
 '(backup-by-copying-when-linked t)
 '(frame-background-mode (quote dark))
 '(git-state-modeline-decoration (quote git-state-decoration-large-dot))
 '(global-font-lock-mode t)
 '(inhibit-startup-screen t)
 '(safe-local-variable-values
   (quote
    ((predictive-mode . 0)
     (ispell-dictionary . "german")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "light gray" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 99 :width normal :foundry "1ASC" :family "Droid Sans Mono")))))
;; load paths
;;(add-to-list 'load-path "~/.emacs.d/<foobar>")

; 
;;(require 'anything)
;;(require 'anything-show-completion)

;; init.el
