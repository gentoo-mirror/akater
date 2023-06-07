# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="High-level SQL database front-end"
HOMEPAGE="https://github.com/magit/emacsql"

EGIT_REPO_URI="https://github.com/magit/${PN}.git"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="builtin +system-sqlite test"

DOCS="README.md"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	app-emacs/pg
	system-sqlite? ( >=dev-db/sqlite-3 )
	builtin? ( >=app-editors/emacs-29 )
"
RDEPEND="
	>=app-editors/emacs-25.1[dynamic-loading]
	builtin? ( >=app-editors/emacs-29 )
"

src_prepare() {
	if ! use builtin ; then
		rm emacsql-sqlite-builtin.el
	fi
	if use system-sqlite ; then
		eapply "${FILESDIR}/system-sqlite3.patch"
		rm sqlite/sqlite*
	fi
	default
}

src_compile() {
	elisp_src_compile

	if use test ; then
		${EMACS} ${EMACSFLAGS} ${BYTECOMPFLAGS} -L tests \
				 -f batch-byte-compile                   \
				 tests/*-tests.el
	fi

	emake -C sqlite
}

src_test() {
	${EMACS} -batch -Q -L . -L tests -L ${SITELISP}/pg \
			 -l tests/${PN}-tests.elc                  \
			 -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."
}

src_install() {
	elisp_src_install

	if use test ; then
		elisp-install ${PN} tests/*.el tests/*.elc
	fi

	exeinto "/usr/bin"
	doexe sqlite/emacsql-sqlite
}
