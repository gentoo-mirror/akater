# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: akater-emacs-nojit.eclass
# @MAINTAINER:
# Dima Akater <nuclearspace@gmail.com>
# @AUTHOR:
# Dima Akater <nuclearspace@gmail.com>
# @SUPPORTED_EAPIS: 4 5 6 7 8
# @BLURB: Just set some variables specific to my live ebuilds
# @DESCRIPTION:
# Almost all my packages don't build with native-comp Emacs right now.
# Native compiler apparently
# - has issues with advised functions;
# - tries to compile even when it shouldn't.

inherit elisp-common

EXPORT_FUNCTIONS pkg_setup

# @FUNCTION: akater-emacs-nojit-emacs-jitp
# @DESCRIPTION:
# Whether Emacs has native-comp
# Code mostly taken verbatim from elisp-emacs-version

akater-emacs-nojit-emacs-jitp() {
	local native_comp ret tmout="timeout -k 5 55"
	# Run without timeout if the command is not available
	${tmout} true &>/dev/null || tmout=""
	# The following will work for at least versions 18-24.
	echo "(progn (require (quote comp) nil t) (princ (featurep (quote comp))))" >"${T}"/emacs-native-comp-p.el
	native_comp=$(
		# EMACS could be a microemacs variant that ignores the -batch
		# option and would therefore hang, waiting for user interaction.
		# Redirecting stdin and unsetting TERM and DISPLAY will cause
		# most of them to exit with an error.
		unset TERM DISPLAY
		${tmout} ${EMACS} -batch -Q -l "${T}"/emacs-native-comp-p.el </dev/null
	)
	ret=$?
	rm -f "${T}"/emacs-native-comp-p.el
	if [[ ${ret} -ne 0 ]]; then
		eerror "akater-emacs-nojit-emacs-jitp: Failed to run ${EMACS}"
		[[ $(realpath ${EMACS} 2>/dev/null) == */emacs* ]] \
			|| eerror "This package needs GNU Emacs"
		return ${ret}
	fi
	if [[ -z ${native_comp} ]]; then
		eerror "akater-emacs-nojit-emacs-jitp: Could not determine whether Emacs has native-comp"
		return 1
	fi
	echo "${native_comp}"
}

# @FUNCTION: akater-emacs-nojit_pkg_setup
# @DESCRIPTION:
# Error when eselected Emacs is jit

akater-emacs-nojit_pkg_setup() {
	local native_comp
	native_comp=$(akater-emacs-nojit-emacs-jitp) \
		|| die "Could not determine whether Emacs has native-comp"

	if ! [[ ${native_comp} =~ ^nil$ ]]; then
		eerror "This package won't build with app-editors/emacs[jit]."
		eerror "Reemerge Emacs with USE=-jit"
		eerror "or use \"eselect emacs\" to select the jit-less version."
		die "Elisp native compilation not supported during build"
	fi
	elisp-check-emacs-version
}
