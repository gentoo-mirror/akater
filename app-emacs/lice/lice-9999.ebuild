# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=24

inherit elisp git-r3

DESCRIPTION="License and header template"
HOMEPAGE="https://github.com/buzztaiki/lice-el"

EGIT_REPO_URI="https://github.com/buzztaiki/lice-el.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="README.md"

SITEFILE="50lice-gentoo.el"

src_compile() {
	elisp_src_compile

	if use test ; then
		${EMACS} ${EMACSFLAGS} ${BYTECOMPFLAGS} -f batch-byte-compile \
				 test/${PN}-tests.el
	fi
}

src_test() {
	${EMACS} -batch -Q -L . -L test  \
			 -l test/${PN}-tests.elc \
			 -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."
}

src_install() {
	elisp_src_install

	if use test ; then
		elisp-install ${PN} test/*.el test/*.elc
	fi

	ebegin "Installing template"
	( # subshell to avoid pollution of calling environment
		insinto "${SITEETC}/${PN}"
		doins -r template
	)
	eend $? "doins failed" || die

	# So that lice works in emacs -Q:
	dosym -r "${SITEETC}/${PN}"/template "${SITELISP}/${PN}"/template
}
