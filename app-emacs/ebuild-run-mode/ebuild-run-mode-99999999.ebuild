# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

inherit elisp-common git-r3

DESCRIPTION="Major mode for Emacs buffers where ebuild commands are run"
HOMEPAGE="https://gitlab.com/akater/emacs-ebuild-run-mode/-/blob/master/ebuild-run-mode.org"
EGIT_REPO_URI="https://gitlab.com/akater/emacs-ebuild-run-mode.git"
EGIT_BRANCH="master"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DOCS="" # README.org is a relative symlink

RDEPEND="
	>=app-emacs/ebuild-mode-1.53
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
