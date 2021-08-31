# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: orgmode.eclass
# @MAINTAINER:
# Dima Akater <nuclearspace@gmail.com>
# @AUTHOR:
# Dima Akater <nuclearspace@gmail.com>
# @SUPPORTED_EAPIS: 4 5 6 7 8
# @BLURB: Eclass for Emacs Lisp packages written in Org
# @DESCRIPTION:
#
# This eclass is designed to deal with Emacs packages
# developed with org-development-elisp
# Deprecated.

# @FUNCTION: orgmode_src_prepare
# @DESCRIPTION:
# Delete custom test system if test use flag is not set

# @FUNCTION: orgmode_src_configure
# @DESCRIPTION:
# Tangle all org files

# @FUNCTION: orgmode_src_compile
# @DESCRIPTION:
# Compile files in ./build/, make texinfo if present

# @FUNCTION: orgmode_src_test
# @DESCRIPTION:
# Test with app-emacs/org-development-elisp

# @FUNCTION: orgmode_src_install
# @DESCRIPTION:
# Install from ./build/

inherit elisp

EXPORT_FUNCTIONS src_prepare src_configure src_compile src_test src_install

EMACSCUSTOMCODE=nil

IUSE+=" test"

# I wish I could
DEPEND+=" test? ( app-emacs/org-development-elisp )"
# but it does not seem

orgmode_src_prepare() {
	use test || rm ${PN}-tests.org

	eapply_user
}

# (require 'org) only becomes necessary
# when org is installed by portage
# and ripped from Emacs install
orgmode_src_configure() {

	all_pn_defvars_code="(progn"
	for code in "${orgmode_configure_pn_defvars[@]}"
	do
		:
		all_pn_defvars_code+=" (defvar ${PN}-${code})"
	done
	all_pn_defvars_code+=")"

	ebegin "Configuring with org"
	${EMACS} ${EMACSFLAGS} ${BYTECOMPFLAGS} \
			 --eval "${all_pn_defvars_code}"                              \
			 --eval "${EMACSCUSTOMCODE}"                                  \
			 --eval "(require 'ob-tangle)"                                \
			 --eval "(require 'org)"                                      \
			 --eval "(defalias 'org-development-elisp-mode 'org-mode)"    \
			 --eval "(require 'files)"                                    \
			 --eval "(defvar use-flags '(${USE}))"                        \
			 --eval "(defvar ob-flags use-flags)"                         \
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
	# local S="${WORKDIR}/${P}/build" doesn't work
	# but it better be something like it
	cd "${WORKDIR}/${P}/build"
	elisp-compile *.el || die "Compiling *.el failed"
	cd "${WORKDIR}/${P}"

	if [[ -n ${ELISP_TEXINFO} ]]; then
		makeinfo ${ELISP_TEXINFO} || die
	fi
}

orgmode_src_test() {
	# we call directory-files twice because sometimes files are not compiled
	if [ "org-development" == "${PN}" ]; then
		die "Testing org-development requires bootstrapping; not done yet"
	elif [[ -f build/${PN}-tests.elc ]] || [[ -f build/${PN}-tests.el ]]; then
		ebegin "Testing with org, as provided by ${PN}"
		${EMACS} ${EMACSFLAGS} \
		 --eval "(let ((load-path (cons (expand-file-name \"build\")  \
										load-path)))                  \
					(load \"${PN}-tests\"))"                          \
		 --eval "(${PN}-tests-run)"
		eend $? "org-development: test phase failed" || die
	else
		ebegin "Testing with org"
		${EMACS} ${EMACSFLAGS} -L . \
				 --eval "(require 'org-development-elisp)"                   \
				 --eval "(setf org-confirm-babel-evaluate nil)"              \
				 --eval "(require 'files)"                                   \
				 --eval "(mapc #'load                                        \
						   (or (directory-files (expand-file-name \"build\") \
											t \"\\\\.elc$\" t)               \
							   (directory-files (expand-file-name \"build\") \
											t \"\\\\.el$\" t)))"             \
				 --eval "(mapc #'org-development-run-tests-in-file           \
						   (directory-files default-directory                \
											t \"\\\\.org$\" t))"
		eend $? "org-development: test phase failed" || die
	fi
}

orgmode_src_install() {
	elisp-install ${PN} build/*.{el,elc} || die "Cannot install elisp files"
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
