
;;; melpa-sources site-lisp configuration

(add-to-list 'load-path "/usr/share/emacs/site-lisp/package-build")

(defconst site-gentoo-melpa-recipes-dir "@RECIPESDIR@/")

(add-to-list 'auto-mode-alist
             `("@RECIPESDIR@/.*" .
               ,(cond
                 ((locate-library "package-recipe-mode")
                  'package-build-minor-mode)
                 ((>= emacs-major-version 28)
                  'lisp-data-mode)
                 (t 'emacs-lisp-mode))))

(custom-set-variables
 '(package-build-recipes-dir site-gentoo-melpa-recipes-dir))

(defcustom site-gentoo-user-melpa-base-dir "~/src/melpa/"
  "User's MELPA directory"
  :group 'package-build
  :type 'string)
