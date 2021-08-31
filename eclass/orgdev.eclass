# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: orgdev.eclass
# @MAINTAINER:
# Dima Akater <nuclearspace@gmail.com>
# @AUTHOR:
# Dima Akater <nuclearspace@gmail.com>
# @SUPPORTED_EAPIS: 4 5 6 7 8
# @BLURB: Eclass for Emacs Lisp packages developed with org-development-elisp
# @DESCRIPTION:
#
# This eclass is designed to deal with Emacs packages
# developed with org-development-elisp
# Deprecated.

# @FUNCTION: orgdev_src_prepare
# @DESCRIPTION:
# Delete custom test system if test use flag is not set

# @FUNCTION: orgdev_src_configure
# @DESCRIPTION:
# Tangle all org files

# @FUNCTION: orgdev_src_compile
# @DESCRIPTION:
# Compile files in ./build/, make texinfo if present

# @FUNCTION: orgdev_src_test
# @DESCRIPTION:
# Test with app-emacs/org-development-elisp

# @FUNCTION: orgdev_src_install
# @DESCRIPTION:
# Install from ./build/

inherit elisp

EXPORT_FUNCTIONS src_prepare src_configure src_compile src_test src_install

EMACSCUSTOMCODE=nil

IUSE="test"

DEPEND=" test? ( app-emacs/org-development-elisp )"

# when ORG_DEVELOPMENT_PROJECT_DIRECTORY is non-empty,
# say something I guess

# anyway, looks we need to fork this eclass and turn it into elisp-esdf.eclass
# but I don't think ORG_DEVELOPMENT_PROJECT_DIRECTORY belongs to such
# so where do we set it?
# where do other (occasional) developers set it?

orgdev_src_prepare() {
	use test || rm ${PN}-tests.org

	eapply_user
}

# (require 'org) only becomes necessary
# when org is installed by portage
# and ripped from Emacs install
orgdev_src_configure() {

	all_pn_defvars_code="(progn"
	for code in "${orgdev_configure_pn_defvars[@]}"
	do
		:
		all_pn_defvars_code+=" (defvar ${PN}-${code})"
	done
	all_pn_defvars_code+=")"

	mkdir build
	cp -f *.org build/
	rm build/README.org

	ebegin "Configuring with org"
	${EMACS} ${EMACSFLAGS} ${BYTECOMPFLAGS} \
			 --eval "${all_pn_defvars_code}"                              \
			 --eval "${EMACSCUSTOMCODE}"                                  \
			 --eval "(require 'ob-tangle)"                                \
			 --eval "(require 'org)"                                      \
			 --eval "(defalias 'org-development-elisp-mode 'org-mode)"    \
			 --eval "(require 'files)"                                    \
			 --eval "(defvar use-flags '(${USE}))"                        \
			 --eval "(defun tangle-unless-readme (filename)               \
					   (unless (string-equal \"README\"                   \
											 (file-name-base filename))   \
						 (org-babel-tangle-file filename)))"              \
			 --eval "(mapc #'tangle-unless-readme                         \
					   (directory-files (expand-file-name \"build\")      \
										t \"\\\\.org$\" t))"              \
	eend $? "org-babel-tangle-file: failed to tangle" || die
}

orgdev_src_compile() {
	# local S="${WORKDIR}/${P}/build" doesn't work
	# but it better be something like it
	cd "${WORKDIR}/${P}/build"
	elisp-compile *.el || die "Compiling *.el failed"
	cd "${WORKDIR}/${P}"

	if [[ -n ${ELISP_TEXINFO} ]]; then
		makeinfo ${ELISP_TEXINFO} || die
	fi
}

orgdev_src_test() {
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

orgdev_src_install() {
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
