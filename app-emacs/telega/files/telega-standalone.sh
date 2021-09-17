#!/bin/sh

case "$1" in
    "nox")
        NO_IMAGES="t"
        ;;
    *)
        NO_IMAGES="nil"
        ;;
esac

exec emacs                                             \
     -Q                                                \
     -L /usr/share/emacs/site-lisp/rainbow-identifiers \
     -L /usr/share/emacs/site-lisp/visual-fill-column  \
     -L /usr/share/emacs/site-lisp/org                 \
     -L /usr/share/emacs/site-lisp/telega              \
     -L /usr/share/emacs/site-lisp/which-key           \
     -L /usr/share/emacs/site-lisp/async               \
     -L /usr/share/emacs/site-lisp/helm                \
     -L /usr/share/emacs/site-lisp/company             \
     --eval "                                          \
(add-to-list 'load-path                                \
             (concat user-emacs-directory \"lisp\"))   \
"                                                      \
      --eval "                                         \
(defvar gentoo-telega-no-images ${NO_IMAGES})          \
"                                                      \
      -l telega-standalone
