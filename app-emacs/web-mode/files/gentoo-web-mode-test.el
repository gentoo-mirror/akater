;;; -*- lexical-binding: t -*-

(require 'nadvice)

(defvar gentoo--web-mode-test-fails nil)

(advice-add 'web-mode-test-process :filter-return
            (defun gentoo--web-mode-test (out)
              (when (string-prefix-p "ko" out)
                (push out gentoo--web-mode-test-fails))))

(defun gentoo--web-mode-test-wrap-up ()
  (if gentoo--web-mode-test-fails
      (message "%s: %s paredit tests failed."
               'gentoo (length gentoo--web-mode-test-fails))
    (message "%s: All tests passed." 'gentoo))
  (kill-emacs (if gentoo--web-mode-test-fails 1 0)))
