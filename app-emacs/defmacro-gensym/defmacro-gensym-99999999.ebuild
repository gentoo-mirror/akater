# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

MY_PN="${PN}"
inherit elisp-common git-r3

DESCRIPTION="Convenient gensyms for defmacro (Emacs Lisp)"
HOMEPAGE="https://gitlab.com/akater/defmacro-gensym/-/blob/master/defmacro-gensym.org"
EGIT_REPO_URI="https://gitlab.com/akater/${MY_PN}.git"
EGIT_BRANCH="master"

LICENSE="Unlicense"
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
