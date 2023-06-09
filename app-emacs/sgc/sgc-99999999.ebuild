# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

MY_PN="elisp-${PN}"
inherit elisp-common akater-live-release

DESCRIPTION="Sufficiently Generic Completion (Emacs Lisp)"
HOMEPAGE="https://gitlab.com/akater/elisp-sgc/-/blob/master/elisp-sgc.org"
EGIT_REPO_URI="https://gitlab.com/akater/elisp-sgc.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 ~x86"
DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/cl-format
	app-emacs/mmxx-macros
"

RDEPEND="
	app-emacs/cl-format
"

export ORG_IMMUTABLE_SOURCES_DIRECTORY="${SITEETC}/${PN}"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
