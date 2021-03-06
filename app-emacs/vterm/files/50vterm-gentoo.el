
;;; vterm site-lisp configuration

(add-to-list 'load-path "/usr/share/emacs/site-lisp/vterm")


;;; begin: forms written by `autoload-generate-file-autoloads'


;;;### (autoloads nil "vterm" "vterm.el" (0 0 0 0))
;;; Generated autoloads from vterm.el

(autoload 'vterm-next-error-function "vterm" "\
Advance to the next error message and visit the file where the error was.
This is the value of `next-error-function' in Compilation
buffers.  Prefix arg N says how many error messages to move
forwards (or backwards, if negative).

Optional argument RESET clears all the errors.

\(fn N &optional RESET)" t nil)

(autoload 'vterm "vterm" "\
Create an interactive Vterm buffer.
Start a new Vterm session, or switch to an already active
session.  Return the buffer selected (or created).

With a nonnumeric prefix arg, create a new session.

With a string prefix arg, create a new session with arg as buffer name.

With a numeric prefix arg (as in `C-u 42 M-x vterm RET'), switch
to the session with that number, or create it if it doesn't
already exist.

The buffer name used for Vterm sessions is determined by the
value of `vterm-buffer-name'.

\(fn &optional ARG)" t nil)

(autoload 'vterm-other-window "vterm" "\
Create an interactive Vterm buffer in another window.
Start a new Vterm session, or switch to an already active
session.  Return the buffer selected (or created).

With a nonnumeric prefix arg, create a new session.

With a string prefix arg, create a new session with arg as buffer name.

With a numeric prefix arg (as in `C-u 42 M-x vterm RET'), switch
to the session with that number, or create it if it doesn't
already exist.

The buffer name used for Vterm sessions is determined by the
value of `vterm-buffer-name'.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vterm" '("vterm-")))

;;;***

;;; end: forms written by `autoload-generate-file-autoloads'
