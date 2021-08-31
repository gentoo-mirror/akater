emacs -Q \
      -L /usr/share/emacs/site-lisp/org \
      -L /usr/share/emacs/site-lisp/rainbow-identifiers \
      -L /usr/share/emacs/site-lisp/telega \
      -L /usr/share/emacs/site-lisp/visual-fill-column \
      --eval "(require 'telega)" \
      --eval "(setq telega-root-fill-column (1- (/ (1- (frame-width)) 2)) telega-chat-fill-column (- telega-root-fill-column 11))" \
      --eval "(telega)"
