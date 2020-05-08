(add-to-list 'load-path "@SITELISP@")
;; (autoload 'portage-highlight-edits-mode "portage-highlight-edits" nil t)

;; (require 'portage-autoloads)

;; perform initial cache
;; todo: delay, async this!
(portage-refresh-package-names-cache)
(portage-refresh-sets-names-cache)
