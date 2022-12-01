# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=25

inherit elisp git-r3

DESCRIPTION="Sqlite3 Emacs module by syohex"
HOMEPAGE="https://github.com/syohex/emacs-sqlite3"

EGIT_REPO_URI="https://github.com/larsmagne/emacs-sqlite3.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
DOCS="README.md"

BDEPEND=">=app-editors/emacs-25[dynamic-loading]
	>=dev-db/sqlite-3"
RDEPEND="${BDEPEND}"

src_prepare() {
	eapply "${FILESDIR}/${PN}"-fix-readme.patch
	eapply_user
}

src_compile() {
	emake "${PN}"-core.so
	elisp-compile "${PN}".el
}

src_test() {
	emake test
}

src_install() {
	elisp-install "${PN}" "${PN}"-core.so
	elisp-install "${PN}" "${PN}"{.el,.elc}
	dodoc "${DOCS}"
}
