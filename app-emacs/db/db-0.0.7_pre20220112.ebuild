# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

MY_PN="emacs-${PN}"
inherit elisp

DESCRIPTION="A database for EmacsLisp"
HOMEPAGE="https://github.com/nicferrier/emacs-db"

SRC_URI="https://github.com/akater/emacs-db/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"
DOCS="README.org"

RDEPEND="
	>=app-emacs/kv-0.0.11
"

S="${WORKDIR}/${MY_PN}-${PV}"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	use test || rm "${PN}-tests.el"
	default
}

src_test() {
	${EMACS} -Q -batch				\
			 -L .					\
			 -L "${SITELISP}/kv"    \
			 -l "${PN}-tests.elc"	\
			 -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."
}

src_install() {
	use test && rm "${PN}-tests.el"
	use test && rm "${PN}-tests.elc"
	elisp_src_install
}
