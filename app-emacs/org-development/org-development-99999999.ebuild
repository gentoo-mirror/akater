# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"
MY_PN="${PN}"

inherit elisp-common akater-live-release

DESCRIPTION="Elisp package that streamlines software development in Org"
HOMEPAGE="https://gitlab.com/akater/org-development"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

RDEPEND="
	app-emacs/etemplate
	app-emacs/org-header-cycling
	app-emacs/ort
	>=app-emacs/poly-org-0.2
"

BDEPEND="${RDEPEND}
	app-emacs/mmxx-macros
	app-emacs/set-endos
"

DEPEND="test? ( app-emacs/akater-misc app-emacs/ort )"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
