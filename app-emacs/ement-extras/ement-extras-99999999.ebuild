# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

MY_PN="emacs-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Extra features for Ement, Matrix client for GNU Emacs"
HOMEPAGE="https://gitlab.com/akater/emacs-ement-extras/-/blob/master/emacs-ement-extras.org"
EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/defmacro-gensym
	app-emacs/ement
	app-emacs/plz
	app-emacs/sgc
"

RDEPEND="
	app-emacs/ement
	app-emacs/sgc
"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
