;; .emacs
(autoload 'my-site-start "~/.emacs.d/my-site-start" nil t)
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
;; load paths
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/c")

;; load libs
;; NOT NEEDED
(load "install-elisp.el" nil t t)

;;(require 'anything)
;;(require 'anything-show-completion)

(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))
(setq debug-on-error t)
(put 'upcase-region 'disabled nil)
;; init.el
