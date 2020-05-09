# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: orgmode.eclass
# @MAINTAINER:
# Gentoo GNU Emacs project <gnu-emacs@gentoo.org>
# @AUTHOR:
# Dima Akater <nuclearspace@gmail.com>
# @SUPPORTED_EAPIS: 4 5 6 7
# @BLURB: Eclass for Emacs Lisp packages written in Org
# @DESCRIPTION:
#
# This eclass is designed to tangle org files of Emacs related
# packages and install the results into the site-lisp directory.

# @FUNCTION: orgmode_src_configure
# @DESCRIPTION:
# Tangle all org files

inherit elisp

EXPORT_FUNCTIONS src_configure src_compile src_install

orgmode_src_configure() {
	ebegin "Configuring with org"
	${EMACS} ${EMACSFLAGS} ${BYTECOMPFLAGS} \
			 --eval "(require 'ob-tangle)"                                \
			 --eval "(require 'find-lisp)"                                \
			 --eval "(require 'files)"                                    \
			 --eval "(defun tangle-unless-readme (filename)               \
					   (unless (string-equal \"README\"                   \
											 (file-name-base filename))   \
						 (org-babel-tangle-file filename)))"              \
			 --eval "(mapc #'tangle-unless-readme                         \
					   (let ((find-lisp-regexp \"\\\\.org$\"))            \
						 (find-lisp-find-files-internal default-directory \
						   #'find-lisp-default-file-predicate             \
						   (lambda (dir parent) nil))))"                  \
	eend $? "org-babel-tangle-file: failed to tangle" || die
}

orgmode_src_compile() {
	elisp-compile elisp/*.el || die "Compiling *.el failed"
}

orgmode_src_install() {
	elisp-install ${PN} elisp/*.{el,elc} || die "Cannot install elisp files"
}
