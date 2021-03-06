# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Create systems of org files from templates"
HOMEPAGE="https://gitlab.com/akater/org-project"

EGIT_REPO_URI="https://gitlab.com/akater/org-project.git"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3+"
SLOT="0"
IUSE=""

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/akater-misc
	app-emacs/eieio-akater-extras
"

RDEPEND="${BDEPEND}"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
