# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

MY_P="emacs-${P}"
inherit elisp

DESCRIPTION="A RPC stack for the Emacs Lisp"
HOMEPAGE="https://github.com/kiwanami/emacs-epc"

SRC_URI="https://github.com/akater/emacs-epc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

IUSE="test"

DOCS="readme.md"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="test? ( app-emacs/deferred app-emacs/concurrent )"
RDEPEND="
	>=app-emacs/concurrent-0.3.1
	>=app-emacs/ctable-0.1.2
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default
	if use test ; then
		eapply "${FILESDIR}/${P}-fix-tests.patch"
	else
		rm test-epc.el
	fi
}

src_test() {
	${EMACS} -L . -batch \
			 -L ${SITELISP}/deferred \
			 -L ${SITELISP}/concurrent \
			 -l test-epc -f ert-run-tests-batch-and-exit
}

src_install() {
	use test && rm test-epc.el && rm test-epc.elc
	elisp_src_install
}
