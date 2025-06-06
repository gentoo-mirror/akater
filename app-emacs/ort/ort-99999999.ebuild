# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"

inherit elisp-common akater-live-release

ORG_UPSTREAM_SOURCES_DIRECTORY="${SITEETC}/org-run-tests"

DESCRIPTION="Treat Org blocks like tests"
HOMEPAGE="https://framagit.org/akater/org-run-tests"

EGIT_REPO_URI="https://framagit.org/akater/org-run-tests.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

IUSE="test"

DOCS="" # README.org is a relative symlink

BDEPEND="
	app-emacs/mmxx-macros
	app-emacs/looking-through
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
