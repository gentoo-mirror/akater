# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit elisp-common akater-live-release

DESCRIPTION="Support for links to CLHS in Org mode"
HOMEPAGE="https://framagit.org/akater/org-clhs"

EGIT_REPO_URI="https://framagit.org/akater/org-clhs.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

RDEPEND="
	dev-lisp/hyperspec
	app-emacs/slime
"

BDEPEND="${RDEPEND}"

DEPEND="
	test? (
			app-emacs/mmxx-macros
			app-emacs/akater-misc
			app-emacs/org-src-elisp-extras
			app-emacs/ort
			)
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
