;; -*- lexical-binding: t -*-

(require 'which-key)
(custom-set-variables
 '(which-key-prefix-prefix)
 '(which-key-separator
   (if (display-graphic-p) " → " " > ")))
(define-key help-map [f2] #'which-key-show-top-level)
(which-key-mode 1)

(require 'helm)
(require 'helm-config)
(custom-set-variables
 '(helm-visible-mark-prefix ""))
(helm-mode 1)
(define-key global-map [?\M-x] #'helm-M-x)
(define-key global-map [?\C-x b] #'helm-buffers-list)
(define-key global-map [f6] #'helm-buffers-list)

(require 'company)
(global-company-mode)

(require 'telega)
(setq telega-root-fill-column (- (/ (1- (frame-width)) 2) 2)
      telega-chat-fill-column (- telega-root-fill-column 10))
(custom-set-variables
 '(telega-completing-read-function #'helm--completing-read-default))
(define-key global-map [f5] #'telega-chat-with)
(defvar gentoo-telega-no-images nil)
(when gentoo-telega-no-images
  (custom-set-variables
   '(telega-symbol-checkmark ",")
   '(telega-symbol-heavy-checkmark ".")
   '(telega-symbol-pending "~")
   '(telega-symbol-telegram "tg")
   '(telega-symbol-ballout-check "v")
   '(telega-symbol-ballout-empty "x")))

(define-key global-map [f7] #'other-window)
(define-key global-map [f11] #'delete-other-windows)
(define-key global-map [f12] #'split-window-right)

(require 'disp-table)
;; solid window separators in terminal
(set-display-table-slot standard-display-table
			'vertical-border
			(make-glyph-code ?│))
(require 'faces)
(defun telega-standalone-tone-down-vertical-border ()
  (set-face-attribute 'vertical-border nil
		      :foreground (face-background 'default)
		      :background (face-background 'default)
		      :inherit nil))
(require 'frame)
(defun telega-standalone-tone-down-frame-elements (frame)
  (select-frame frame)
  ;; (telega-standalone-tone-down-fringes)
  (telega-standalone-tone-down-vertical-border))
(add-hook 'after-make-frame-functions
          #'telega-standalone-tone-down-frame-elements)

(provide 'telega-standalone)

(telega)
(sit-for 4)
(progn
  (split-window-right)
  (other-window 2)
  (with-current-buffer (get-buffer-create "*Help: app-emacs/telega*")
    (insert "Press F1 F2 for keys"
            ?\n "Press F1 t for tutorial"
            ?\n "C-h means Ctrl+h, M-x means Alt+x, and so on."
            ?\n "RET means Enter, DEL means Backspace (!), SPC means Spacebar"
            ?\n "To leave most menus, press C-g (remember this)"
            ?\n "To select a candidate in a menu, press RET"
            ?\n "Press F5 to switch between Telegram chats"
            ?\n "Press @ TAB in chat buffers to complete user names"
            ?\n "Press / TAB in chat buffers to complete bot commands"
            ?\n "Press PgUp, PgDown to go up, down and scroll history"
            ?\n "Press F6 to switch between buffers (remember this, and you won't get lost)"
            ?\n "Press F7 to switch between windows"
            ?\n "Press F11 to maximize current window"
            ?\n "Press F12 to split current window in the middle"
            ?\n "Press M-< to go to the beginning of buffer"
            ?\n "Press M-> to go to the end of buffer"
            ?\n "Press M-x to do anything"
            ?\n "Press C-x C-c to leave Emacs (and kill telega-server)")
    (display-buffer (current-buffer))))
