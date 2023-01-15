;;; -*- lexical-binding: t -*-

(require 'org)
(require 'org-element)
(setq org-element-cache-persistent nil)

(require 'ox-texinfo)

(defun org-texinfo-src-block (src-block _contents info)
  "Transcode a SRC-BLOCK element from Org to Texinfo.
CONTENTS holds the contents of the item.  INFO is a plist holding
contextual information."
  (let* ((lisp (ignore-errors
                 ;; make it work with language-less src blocks
                 (string-match-p "lisp"
			         (org-element-property :language src-block))))
	 (code (org-texinfo--sanitize-content
		(org-export-format-code-default src-block info)))
	 (value (format
		 (if lisp "@lisp\n%s@end lisp" "@example\n%s@end example")
		 code))
	 (caption (org-export-get-caption src-block))
	 (shortcaption (org-export-get-caption src-block t)))
    (if (not (or caption shortcaption)) value
      (org-texinfo--wrap-float value
			       info
			       (org-export-translate "Listing" :utf-8 info)
			       (org-texinfo--get-node src-block info)
			       caption
			       shortcaption))))

(defun telega--make-texinfo (filename)
  (setq filename (expand-file-name filename))
  (let ((default-directory (file-name-directory filename)))
    (with-current-buffer (find-file-noselect filename)
      (org-texinfo-export-to-texinfo))))
