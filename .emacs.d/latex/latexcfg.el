;; B0RKED, because this moron modiified the upstream version
;; (require 'predictive)
;; (autoload 'predictive-mode "predictive" "predictive" t)
;; (set-default 'predictive-auto-add-to-dict t)
;; (setq predictive-auto-learn t
;;       predictive-add-to-dict-ask nil
;;       predictive-use-auto-learn-cache nil
;;       predictive-which-dict t
;;       fill-column 80
;;       )

(linum-mode 1)
(setq TeX-command-default "LatexMk")
(setq Tex-parse-self t)
(setq-default TeX-master nil) ; Query for master file.
(setq TeX-PDF-mode t) ; default pdf latex mode
(turn-on-auto-fill) ; auto line breaks
(flyspell-mode) ; spell checking
(turn-on-reftex)
;(visual-line-mode)
(LaTeX-math-mode) ; maybe
(setq reftex-plug-into-AUCTeX t)
; default bibliography
(setq reftex-default-bibliography '("~/texmf/bibtex/bib/local/master-bibliography.bib"))
(add-to-list 'TeX-command-list '("Make" "make" TeX-run-command nil t)) ; default command: make on C-c C-c

;(ac-config-default)
(require 'auctex-latexmk)
(auctex-latexmk-setup)

; TeX-language-de-hook
(add-hook 'TeX-language-de-hook
	  (lambda () (ispell-change-dictionary "de_AT")))
