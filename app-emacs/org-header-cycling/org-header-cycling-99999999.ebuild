# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"
MY_PN="${PN}"

inherit elisp-common akater-live-release

DESCRIPTION="Elisp package that allows convenient cycling of org src block headers"
HOMEPAGE="https://gitlab.com/akater/org-header-cycling"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

# SITEFILE="50${PN}-gentoo.el"

RDEPEND="
	app-emacs/set-endos
"

BDEPEND="${RDEPEND}
	app-emacs/mmxx-macros
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
