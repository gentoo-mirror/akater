# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp

DESCRIPTION="High-level SQL database front-end"
HOMEPAGE="https://github.com/magit/emacsql"

SRC_URI="https://github.com/magit/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+system-sqlite test"

DOCS="README.md"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	app-emacs/pg
	system-sqlite? ( >=dev-db/sqlite-3 )"
RDEPEND="
	>=app-editors/emacs-25.1[dynamic-loading]
"

src_prepare() {
	if use system-sqlite ; then
		eapply "${FILESDIR}/emacsql-3.1.1-system-sqlite.patch"
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
