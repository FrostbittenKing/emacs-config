;; melpa initialization
(package-initialize)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; first time initialization of packages to install
(defun init-emacs-cfg ()
  (interactive)
  (setq package-list '(ac-c-headers ac-dabbrev ac-emmet ac-etags ac-geiser ac-helm ac-inf-ruby ac-ispell ac-js2 ac-math ac-slime ansi anything async auctex auctex-latexmk auto-complete autopair cider clojure-mode commander dash ecukes emmet-mode epl espuds f feature-mode flycheck geiser gitignore-mode haml-mode helm helm-core inf-ruby js2-mode latex-preview-pane let-alist macrostep markdown-mode markdown-mode+ markdown-toc math-symbol-lists noflet pcre2el pkg-info popup queue rsense rubocop ruby-electric s seq simple-httpd skewer-mode slime spinner yari yasnippet yaml-mode))

					; fetch the list of packages available
  (unless package-archive-contents
    (package-refresh-contents))
  
					; install the missing packages
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package)))
  )

(init-emacs-cfg)
