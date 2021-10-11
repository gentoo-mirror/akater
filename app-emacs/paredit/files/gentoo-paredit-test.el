;;; -*- lexical-binding: t -*-

(defvar gentoo--paredit-test-fails nil)

(defvar paredit-test-failure-function
  (defun gentoo--paredit-test (command before after expected)
    (push command gentoo--paredit-test-fails)
    (message "%S failed test: after %S, got %S but expected %S."
             command before after expected)))

(defun gentoo--paredit-test-wrap-up ()
  (if gentoo--paredit-test-fails
      (message "%s: %s paredit tests failed."
               'gentoo (length gentoo--paredit-test-fails))
    (message "%s: All tests passed." 'gentoo))
  (kill-emacs (if gentoo--paredit-test-fails 1 0)))
