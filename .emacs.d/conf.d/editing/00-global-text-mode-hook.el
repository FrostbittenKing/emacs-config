;; text-mode
(defun editing()
  (my-linum-mode)
  )

;; global text-mode
(add-hook 'text-mode-hook 'editing)
;; install hooks automatically
(install-hooks (enum-directories "~/.emacs.d/conf.d/editing"))

