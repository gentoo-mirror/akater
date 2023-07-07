# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit elisp-common akater-live-release

DESCRIPTION="Create systems of org files from templates"
HOMEPAGE="https://gitlab.com/akater/etemplate"

EGIT_REPO_URI="https://gitlab.com/akater/etemplate.git"

KEYWORDS="amd64 ~x86"
LICENSE="GPL-3+"
SLOT="0"

IUSE="test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/eieio-akater-extras
	app-emacs/mmxx-macros
"

RDEPEND="${BDEPEND}"

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
