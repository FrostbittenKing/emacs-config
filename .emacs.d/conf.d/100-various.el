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

(setq-default ispell-program-name "aspell")
