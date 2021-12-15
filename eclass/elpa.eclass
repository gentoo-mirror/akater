# Copyright 2002-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: elpa.eclass
# @MAINTAINER:
# Project Emacs <emacs@gentoo.org>
# @AUTHOR:
# Project Emacs <emacs@gentoo.org>
# @SUPPORTED_EAPIS: 7
# @BLURB: Eclass for packages from ELPAs (Emacs Lisp Package Archives)
# @DESCRIPTION:
# Fetch, compile and install packages from ELPAs easily
# We presume the package is signed by default;
# see the variable ELPA_SIG for details

inherit elisp

# @ECLASS-VARIABLE: ELPA_CONTAINER_KIND
# @DESCRIPTION:
# How the package is served by an ELPA.  Set this before “inherit elpa”.
# Valid values include at least tar, dir, single.
# Corresponding slot is named “kind” in package.el so we use “kind” too.
# cf. defun package-unpack in package.el
ELPA_CONTAINER_KIND=${ELPA_CONTAINER_KIND=single}

# @ECLASS-VARIABLE: ELPA_URI
# @DESCRIPTION:
# Complete path to packages directory of an ELPA.
# Set this before “inherit elpa”.
# No trailing slash (?)
ELPA_URI=${ELPA_URI:=https://elpa.gnu.org/packages}

# not true for non-gnu elpa but the eclass is mostly useful for gnu elpa
# let it be here so far, I don't know what to do
LICENSE="GPL-3+"

# @FUNCTION: elpa-uri-suffix
# @RETURN: Suffix for the packaged entity, determined by ELPA_CONTAINER_KIND
# @DESCRIPTION:
# Maybe should be internal.

elpa-uri-suffix() {
	local suffix=""
	case "${ELPA_CONTAINER_KIND}" in
		 single) suffix=".el" ;;
		 tar) suffix=".tar" ;;
		 dir) ;;
		 # the above three are cleanly supported by package-unpack
		 # the rest is up to user
		 *) suffix="${ELPA_CONTAINER_KIND}" ;;
		 # I considered prefixing with . but decided against this so far
	esac
	echo "${suffix}"
}

# @ECLASS-VARIABLE: ELPA_SIG
# @DESCRIPTION:
# .asc file containing public keys to check the attached signature against
# Must be in /usr/share/openpgp-keys/
# .asc extension is attached automatically.
#
# Set this before “inherit elpa”.
# To specify unsigned package, use ELPA_SIG=""
# If you specify ELPA_SIG that is not supported by elpa.eclass,
# you have to add app-crypt/openpgp-keys-... to BDEPEND manually
#
# Note: this might have been determined from ELPA_URI
# if we had a dedicated “elpa-signed” eclass
# but in general an ELPA package may simply be unsigned
# so we have to have a variable that specifies the signature explicitly.
ELPA_SIG=${ELPA_SIG=elpa.gnu.org}

# @FUNCTION: elpa-openpgp-keys-dep
# @RETURN: BDEPEND substring for signature checking; empty for no signature
# @DESCRIPTION:
# Can be appended to BDEPEND unconditionally
# but we only append when ELPA_SIG is non-empty.

elpa-openpgp-keys-dep() {
	local suffix=
	case "${ELPA_SIG}" in
		elpa.gnu.org) suffix="gnu-elpa" ;;
		# no other ELPA repos are known to elpa.eclass
	esac
	echo "    verify-sig? ( app-crypt/openpgp-keys-${suffix} )"
}

# @ECLASS-VARIABLE: ELPA_P
# @DESCRIPTION:
# Just ${P} with suffix determined by ELPA_CONTAINER_KIND.
# Used in signature verification procedure elpa-verify-sig.
ELPA_P="${P}$(elpa-uri-suffix)"

# @ECLASS-VARIABLE: ELPA_PN
# @DESCRIPTION:
# Just ${PN} with suffix determined by ELPA_CONTAINER_KIND.
# Used in elpa_src_prepare.
ELPA_PN="${PN}$(elpa-uri-suffix)"

# @FUNCTION: elpa-src-uri
# @RETURN: Complete path to the packaged entity
# @DESCRIPTION:
# Used twice hence implemented as a function.

elpa-src-uri() {
	echo "${ELPA_URI}/${ELPA_P}"
}

HOMEPAGE="${ELPA_URI}/${PN}.html"

# @FUNCTION: elpa-egit-repo-uri
# @RETURN: Complete path to ELPA's git repository of a package
# @DESCRIPTION:
# Return complete path to ELPA's git repository of a package, for live ebuilds

elpa-egit-repo-uri() {
	local uri=
	case "${ELPA_SIG}" in
		elpa.gnu.org) uri="https://git.savannah.gnu.org/git/emacs/elpa.git" ;;
		# no other ELPA repos are known to elpa.eclass
	esac
	echo "${uri}"
}

# @FUNCTION: elpa-egit-repo-branch
# @RETURN: Branch in ELPA's git repository of a package
# @DESCRIPTION:
# Return branch in ELPA's git repository of a package, for live ebuilds

elpa-egit-repo-branch() {
	local branch=
	case "${ELPA_SIG}" in
		elpa.gnu.org) branch="externals/${PN}" ;;
		# no other ELPA repos are known to elpa.eclass
	esac
	echo "${branch}"
}

if [[ "9999" == "${PV}" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="$(elpa-egit-repo-uri)"
	EGIT_BRANCH="$(elpa-egit-repo-branch)"
	EGIT_CLONE_TYPE="single"
	ELPA_SIG=""
	ELPA_CONTAINER_KIND="git"
else
	SRC_URI="$(elpa-src-uri)"
	RESTRICT="mirror"
fi

# @FUNCTION: elpa-src-unpack-single
# @RETURN: 0 on success
# @DESCRIPTION:
# Unpack a single file ELPA package.

elpa-src-unpack-single() {
	mkdir ${P} && cd ${P}
	cp -t . ${DISTDIR}/${ELPA_P}
	return 0
}

# @FUNCTION: elpa-src-unpack-container
# @RETURN: 0 on success
# @DESCRIPTION:
# Unpack an ELPA package, depending on container's kind.

elpa-src-unpack-container() {
	case "${ELPA_CONTAINER_KIND}" in
		 single) elpa-src-unpack-single ;;
		 tar) default_src_unpack ;;
		 dir) die "elpa_src_unpack for dir containers not implemented"
			  ;;
		 # adhoc container
		 git) git-r3_src_unpack ;;
		 # this is our guess
		 *) default_src_unpack ;;
	esac
	return 0
}

# @FUNCTION: elpa_src_unpack
# @RETURN: 0 on success
# @DESCRIPTION:
# Unpack an ELPA package.
# See also “signed version” below.

elpa_src_unpack() {
	elpa-src-unpack-container
}

# @FUNCTION: elpa_src_prepare
# @RETURN: Whatever default returns
# @DESCRIPTION:
# Prepare an ELPA package.

elpa_src_prepare() {
	case "${ELPA_CONTAINER_KIND}" in
		 single) mv ${ELPA_P} ${ELPA_PN} ;;
		 tar) ;;
		 dir) die "elpa_src_prepare for dir containers not implemented" ;;
		 # this is our guess
		 *) ;;
	esac
	default
}

if [[ -n "${ELPA_SIG}" ]] ; then
	inherit verify-sig
	IUSE="+verify-sig"
	SRC_URI+=" verify-sig? ( $(elpa-src-uri).sig )"
	VERIFY_SIG_OPENPGP_KEY_PATH="/usr/share/openpgp-keys/${ELPA_SIG}.asc"
	BDEPEND+="$(elpa-openpgp-keys-dep)"

# @FUNCTION: elpa-verify-sig
# @RETURN: Whatever verify-sig_verify_detached returns
# @DESCRIPTION:
# Verify signature of an ELPA package.

elpa-verify-sig() {
	use verify-sig && \
		verify-sig_verify_detached ${DISTDIR}/${ELPA_P} \
								   ${DISTDIR}/${ELPA_P}.sig
	}

# @FUNCTION: elpa_src_unpack
# @RETURN: 0 on success
# @DESCRIPTION:
# Unpack signed ELPA package.

elpa_src_unpack() {
	elpa-verify-sig
	elpa-src-unpack-container
}

fi

EXPORT_FUNCTIONS src_unpack src_prepare
