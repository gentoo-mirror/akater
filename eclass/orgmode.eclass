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
			 --eval "(require 'files)"                                    \
			 --eval "(defvar use-flags '(${USE}))"                        \
			 --eval "(defun tangle-unless-readme (filename)               \
					   (unless (string-equal \"README\"                   \
											 (file-name-base filename))   \
						 (org-babel-tangle-file filename)))"              \
			 --eval "(mapc #'tangle-unless-readme                         \
					   (directory-files default-directory                 \
										t \"\\\\.org$\" t))"              \
	eend $? "org-babel-tangle-file: failed to tangle" || die
}

orgmode_src_compile() {
	# local S="${WORKDIR}/${P}/elisp" doesn't work
	# but it better be something like it
	cd "${WORKDIR}/${P}/elisp"
	elisp-compile *.el || die "Compiling *.el failed"
	cd "${WORKDIR}/${P}"

	if [[ -n ${ELISP_TEXINFO} ]]; then
		makeinfo ${ELISP_TEXINFO} || die
	fi
}

orgmode_src_install() {
	elisp-install ${PN} elisp/*.{el,elc} || die "Cannot install elisp files"
	if [[ -n ${SITEFILE} ]]; then
		elisp-site-file-install "${FILESDIR}/${SITEFILE}"
	fi
	if [[ -n ${ELISP_TEXINFO} ]]; then
		set -- ${ELISP_TEXINFO}
		set -- ${@##*/}
		doinfo ${@/%.*/.info*}
	fi
	# install documentation only when explicitly requested
	case ${EAPI} in
		4|5) [[ -n ${DOCS} ]] && dodoc ${DOCS} ;;
		*) [[ $(declare -p DOCS 2>/dev/null) == *=* ]] && einstalldocs ;;
	esac
	if declare -f readme.gentoo_create_doc >/dev/null; then
		readme.gentoo_create_doc
	fi
}
