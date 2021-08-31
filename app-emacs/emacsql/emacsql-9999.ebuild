# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="high-level SQL database front-end"
HOMEPAGE="https://github.com/skeeto/emacsql"

# EGIT_REPO_URI="https://github.com/skeeto/emacsql.git"
EGIT_REPO_URI="https://github.com/akater/emacsql.git"
EGIT_BRANCH="fix-describe-initialize-instance"
KEYWORDS="~amd64 ~x86"

LICENSE="Unlicense"
SLOT="0"
DOCS="README.md"
IUSE="+system-sqlite"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	app-emacs/pg
	system-sqlite? ( >=dev-db/sqlite-3 )"
RDEPEND="
	>=app-editors/emacs-25.1[dynamic-loading]
"

src_prepare() {
	if use system-sqlite ; then
		eapply "${FILESDIR}/system-sqlite3.patch"
		rm sqlite/sqlite*
	fi
	default
}

src_compile() {
	elisp_src_compile
	emake -C sqlite
}

src_test() {
	${EMACS} ${EMACSFLAGS} ${BYTECOMPFLAGS} -L tests -f batch-byte-compile \
			 tests/*-tests.el
	${EMACS} -batch -Q -L . -L tests -L ${SITELISP}/pg \
			 -l tests/emacsql-tests.elc -f ert-run-tests-batch
}

src_install() {
	elisp_src_install
	exeinto "/usr/bin"
	doexe sqlite/emacsql-sqlite
}
