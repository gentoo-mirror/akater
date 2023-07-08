# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"
MY_PN="emacs-${PN}"

inherit elisp-common akater-live-release

DESCRIPTION="Surface-level non-English (NonEn) Elisp in Emacs"
HOMEPAGE="https://framagit.org/akater/emacs-nonen"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

DEPEND="test? ( app-emacs/ort )"

SITEFILE="50${PN}-gentoo.el"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
