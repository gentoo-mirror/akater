# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit elisp-common akater-live-release akater-emacs-nojit

DESCRIPTION="Support for links to CLHS in Org mode"
HOMEPAGE="https://framagit.org/akater/org-clhs"

EGIT_REPO_URI="https://framagit.org/akater/org-clhs.git"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="" # README.org is a relative symlink

RDEPEND="
	dev-lisp/hyperspec
	app-emacs/slime
	test? (
			app-emacs/mmxx-macros
			app-emacs/akater-misc
			app-emacs/org-development-elisp
			)
"

BDEPEND="${RDEPEND}"

pkg_postinst() {
	elisp-site-regen
	if declare -f readme.gentoo_print_elog >/dev/null; then
		readme.gentoo_print_elog
	fi
}

pkg_postrm() {
	elisp-site-regen
}
