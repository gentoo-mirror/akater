# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

MY_PN="elisp-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Emacs Lisp's looking-at, followed by movement if match succeeded"
HOMEPAGE="https://framagit.org/akater/elisp-dotree"

EGIT_REPO_URI="https://framagit.org/akater/${MY_PN}.git"
EGIT_CLONE_TYPE="single+tags"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

DOCS="" # README.org is a relative symlink

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
