# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

MY_PN="emacs-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Gentoo dashboard for Emacs"
HOMEPAGE="https://framagit.org/akater/emacs-magentoo"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"
EGIT_CLONE_TYPE="single+tags"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

DOCS="" # README.org is a relative symlink

IUSE="debug magit-section test"

BDEPEND="
	app-emacs/eieio-akater-extras
	magit-section? ( app-emacs/magit-section )
	!magit-section? ( app-emacs/magit )
	app-emacs/transient
"
RDEPEND="
	app-emacs/eieio-akater-extras
	magit-section? ( app-emacs/magit-section )
	!magit-section? ( app-emacs/magit )
	app-emacs/transient
"

DEPEND="test? ( app-emacs/ort )"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
