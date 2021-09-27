;; -*- lexical-binding: t -*-

(require 'dired)
(dired default-directory)

(custom-set-variables
 '(dired-dwim-target t))

(provide 'dired-standalone)

(require 'wdired)
(custom-set-variables
 '(wdired-allow-to-change-permissions nil))

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
 '(helm-visible-mark-prefix "")
 '(helm-ff-use-notify t)
 '(helm-ff-skip-boring-files t))
(helm-mode 1)
(define-key global-map [?\M-x] #'helm-M-x)
(define-key global-map [?\C-x b] #'helm-buffers-list)
(define-key global-map [f5] #'helm-find-files)
(define-key global-map [f6] #'helm-buffers-list)
(custom-set-faces
 '(helm-buffer-directory ((((type nil)) (:inherit dired-directory))))
 '(helm-buffer-file ((((type nil)) (:weight normal))))
 '(helm-buffer-modified ((((type nil)) (:inherit error))))
 '(helm-buffer-not-saved ((((type nil)) (:foreground "yellow"))))
 '(helm-buffer-process ((((type nil)) (:foreground "magenta" :weight bold))))
 '(helm-buffer-saved-out ((((type nil)) (:inherit warning))))
 '(helm-non-file-buffer ((((type nil)) (:foreground "cyan" :background "black" :weight bold :inherit nil))))
 '(helm-buffer-size ((((type nil)) (:foreground "yellow"))))
 '(helm-candidate-number ((((type nil)) (:foreground "black" :background "yellow" :weight normal))))
 '(helm-ff-directory ((((type nil)) (:inherit helm-buffer-directory))))
 '(helm-ff-dotted-directory ((((type nil)) (:foreground "white" :weight normal))))
 '(helm-ff-file ((((min-colors 256)) (:inherit default))
                 (((type nil)) (:foreground "white" :background "black" :weight bold))))
 '(helm-ff-prefix ((((min-colors 256)) (:background "#1d1f21" :foreground "#ff3334"))
                   (((type nil)) (:background "black" :foreground "red" :weight normal))))
 ;; helm needs “selected” variant for the following two faces:
 '(helm-ff-symlink ((((type nil)) (:foreground "cyan" :weight bold))))
 '(helm-ff-truename ((((type nil)) (:foreground "yellow" :weight bold))))
 ;; '(helm-ff-prefix ((((type nil)) (:background "red" :foreground "white" :weight normal))))
 '(helm-header-line-left-margin ((((type nil)) (:foreground "black" :background "yellow" :weight normal))))
 '(helm-history-deleted ((((type nil)) (:foreground "black" :background "red" :weight normal))))
 '(helm-lisp-show-completion ((((type nil)) (:foreground "black" :background "green" :weight normal))))
 '(helm-match ((((type nil)) (:inherit match))))
 '(helm-minibuffer-prompt ((((type nil)) (:inherit minibuffer-prompt))))
 '(helm-mode-prefix ((((type nil)) (:foreground "black" :background "red" :weight normal))))
 '(helm-selection ((((type nil)) (:foreground "black" :background "green" :weight normal))))
 '(helm-selection-line ((((type nil)) (:foreground "red" :weight normal :inherit nil))))
 '(helm-separator ((((type nil)) (:foreground "magenta"))))
 '(helm-source-header ((((min-colors 256)) (:foreground "#de935f" :weight bold :height 1.0))
                       (((type nil)) (:weight bold :foreground "yellow"))))
 '(helm-visible-mark ((((min-colors 256)) (:background "#b5bd68" :foreground "#1d1f21"))
                      (((type nil)) (:background "blue" :foreground "white" :weight normal :inherit nil))))

 '(helm-M-x-key ((((min-colors 256)) (:foreground "#f0c674" :underline t)))))

(define-key global-map [f7] #'other-window)
(define-key global-map [f11] #'delete-other-windows)
(define-key global-map [f12] #'split-window-right)

(require 'disp-table)
;; solid window separators in terminal
(set-display-table-slot standard-display-table
			'vertical-border
			(make-glyph-code ?│))
(require 'faces)
(defun dired-standalone-tone-down-vertical-border ()
  (set-face-attribute 'vertical-border nil
		      :foreground (face-foreground 'default)
		      :background (face-background 'default)
		      :inherit nil))
(dired-standalone-tone-down-vertical-border)

(require 'frame)
(defun dired-standalone-tone-down-frame-elements (frame)
  (select-frame frame)
  ;; (dired-standalone-tone-down-fringes)
  (dired-standalone-tone-down-vertical-border))
(add-hook 'after-make-frame-functions
          #'dired-standalone-tone-down-frame-elements)

(defun dired-standalone-init ()
  (make-frame)
  (split-window-right)
  (with-current-buffer (get-buffer-create "*Help: app-fm/dired*")
    (insert "Press F1 F2 for keys"
            ?\n "Press F1 t for tutorial"
            ?\n "C-h means Ctrl+h, M-x means Alt+x, and so on."
            ?\n "RET means Enter, DEL means Backspace (!), SPC means Spacebar"
            ?\n "To leave most menus, press C-g (remember this)"
            ?\n "To select a candidate in a menu, press RET"
            ?\n "Press F5 to select a directory (C-m, Enter) or a file (C-j)"
            ?\n "Press TAB in file select menu to see the actions"
            ?\n "Press PgUp, PgDown to go up, down and scroll history"
            ?\n "Press F6 to switch between buffers (remember this, and you won't get lost)"
            ?\n "Press F7 to switch between windows"
            ?\n "Press F11 to maximize current window"
            ?\n "Press F12 to split current window in the middle"
            ?\n "Press M-< to go to the beginning of buffer"
            ?\n "Press M-> to go to the end of buffer"
            ?\n "Press M-x to do anything"
            ?\n "Press C-x C-c to leave Emacs")
    (display-buffer (current-buffer))))
