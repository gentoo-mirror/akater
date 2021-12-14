(add-to-list 'load-path "@SITELISP@")

(autoload 'bib-cite-minor-mode "bib-cite" nil t nil)
(autoload 'turn-on-bib-cite "bib-cite" nil nil nil)

(defalias 'ConTeXt-mode #'context-mode)
(autoload 'context-mode "context" nil t nil)
(autoload 'context-en-mode "context-en" nil t nil)
(autoload 'context-nl-mode "context-nl" nil t nil)

(autoload 'font-latex-setup "font-latex" nil nil nil)

(autoload 'BibTeX-auto-store "latex" nil nil nil)

(add-to-list 'auto-mode-alist '("\\.drv\\'" . latex-mode) t)
(add-to-list 'auto-mode-alist '("\\.hva\\'" . latex-mode))

(autoload 'TeX-latex-mode "latex" nil t nil)
(add-to-list 'auto-mode-alist '("\\.dtx\\'" . doctex-mode))
(autoload 'docTeX-mode "latex" nil t nil)
(defalias 'TeX-doctex-mode #'docTeX-mode)

(autoload 'multi-prompt "multi-prompt" nil nil nil)
(autoload 'multi-prompt-key-value "multi-prompt" nil nil nil)

(autoload 'TeX-plain-tex-mode "plain-tex" nil t nil)
(autoload 'ams-tex-mode "plain-tex" nil t nil)

(autoload 'preview-install-styles "preview" nil t nil)
(autoload 'LaTeX-preview-setup "preview" nil nil nil)
(autoload 'preview-report-bug "preview" nil t nil)

(autoload 'TeX-tex-mode "tex" nil t nil)
(autoload 'TeX-auto-generate "tex" nil t nil)
(autoload 'TeX-auto-generate-global "tex" nil t nil)
(autoload 'TeX-submit-bug-report "tex" nil t nil)

(autoload 'TeX-install-toolbar "tex-bar" nil t nil)
(autoload 'LaTeX-install-toolbar "tex-bar" nil t nil)

(autoload 'TeX-fold-mode "tex-fold" nil t nil)
(defalias 'tex-fold-mode #'TeX-fold-mode)

(autoload 'tex-font-setup "tex-font" nil nil nil)

(defalias 'Texinfo-mode #'texinfo-mode)
(autoload 'TeX-texinfo-mode "tex-info" nil t nil)

(autoload 'japanese-plain-tex-mode "tex-jp" nil t nil)
(autoload 'japanese-latex-mode "tex-jp" nil t nil)

(require 'tex-site)
;; detect needed steps after rebuild
(setq TeX-parse-self t)

(autoload 'texmathp "texmathp" nil t nil)
(autoload 'texmathp-match-switch "texmathp" nil nil nil)

(autoload 'toolbarx-install-toolbar "toolbar-x")
