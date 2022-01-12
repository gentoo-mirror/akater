# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.1"

inherit elisp

DESCRIPTION="Jump to arbitrary positions in visible text and select text quickly."
HOMEPAGE="https://github.com/abo-abo/avy"

SRC_URI="https://github.com/abo-abo/avy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="README.md"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	use test || rm "${PN}-test.el"
	default
}

src_test() {
	${EMACS} -Q -batch				\
			 -L .					\
			 -l "${PN}-test.elc"	\
			 -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."
}

src_install() {
	use test && rm "${PN}-test.el"
	use test && rm "${PN}-test.elc"
	elisp_src_install
}
