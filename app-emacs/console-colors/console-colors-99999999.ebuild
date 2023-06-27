# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="emacs-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Emacs interface to console colors"
HOMEPAGE="https://gitlab.com/akater/emacs-console-colors"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="nopasswd"

DOCS="" # README.org is a relative symlink

IUSE="test"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	app-emacs/mmxx-macros
	app-emacs/akater-misc
	app-emacs/shmu
"
RDEPEND="
	app-admin/sudo
	sys-apps/kbd
	app-emacs/akater-misc
	app-emacs/shmu"

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
