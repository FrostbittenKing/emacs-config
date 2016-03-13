(require 'rsense)
;; ac
;; Missing from ruby-mode.el, see https://groups.google.com/group/emacs-on-rails/msg/565fba8263233c28
(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))
;; workaround for moron

(flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
  (add-to-list 'ac-omni-completion-sources
                       (cons "\\." '(ac-source-semantic)))
          (add-to-list 'ac-omni-completion-sources
                       (cons "->" '(ac-source-semantic)))

;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets/yasnippet-snippets/")
;;       )

;; (yas-global-mode 1)

(setq ruby-insert-encoding-magic-comment t
      ruby-indent-tabs-mode t
      ruby-indent-level 2
      tab-width 2)

;; indent-tabs-mode t)
;;(setq yas-snippet-dirs (cons "~/.emacs.d/snippets/yasnippet-snippets/" yas-snippet-dirs))

;(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")

