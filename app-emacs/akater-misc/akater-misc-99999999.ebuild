# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

MY_PN="elisp-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Emacs Lisp accessory functions used by akater"
HOMEPAGE="https://gitlab.com/akater/elisp-akater-misc"

EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~x86"

DOCS="" # README.org is a relative symlink

IUSE="ansi-color esdf test"
REQUIRED_USE="test? ( ansi-color )"

BDEPEND="
	app-emacs/mmxx-macros
	ansi-color? ( app-emacs/ansi )
"

DEPEND="test? ( app-emacs/ort app-emacs/org-src-elisp-extras )"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
