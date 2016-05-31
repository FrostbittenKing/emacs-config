;; text-mode
(defun editing()
  (linum-mode)
  )

;; global text-mode
(add-hook 'text-mode-hook 'editing)
;; install hooks automatically
(install-hooks (enum-directories "~/.emacs.d/conf.d/editing"))

