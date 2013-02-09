;; .emacs

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
(add-to-list 'load-path "~/git-emacs")
(require 'git-emacs)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(git-state-modeline-decoration (quote git-state-decoration-large-dot))
 '(global-font-lock-mode t)
 '(inhibit-startup-screen t))
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
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/c")
(add-to-list 'load-path "~/.emacs.d/latex")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")

;; load libs


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
(ac-config-default)

(load-file "~/cedet-1.1/common/cedet.elc")
(load "install-elisp.el" nil t t)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; install popup-el
;;(auto-install-from-url "https://github.com/m2ym/popup-el/raw/master/popup.el")

(require 'yasnippet)

;; C++ Mode
(defun c_coding ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  (add-to-list 'ac-sources 'ac-source-semantic-raw)
  (load-library "ccfg")
)

;; Latex Mode
(defun latex_docs ()
  (load-library "latexcfg")
)

;; install hooks

(add-hook 'c-mode-common-hook 'c_coding)
(add-hook 'LaTeX-mode-hook 'latex_docs)
(ac-set-trigger-key "TAB")

