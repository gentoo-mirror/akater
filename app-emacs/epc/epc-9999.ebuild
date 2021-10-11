# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3 git-extras

DESCRIPTION="A RPC stack for the Emacs Lisp"
HOMEPAGE="https://github.com/kiwanami/emacs-epc"

# EGIT_REPO_URI="https://github.com/kiwanami/emacs-epc.git"
EGIT_REPO_URI="https://github.com/akater/emacs-epc.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="mirror"
KEYWORDS="~amd64 ~x86"

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

src_prepare() {
	git branch work
	git switch work
	git-merge lexical-binding
	git-merge fix-tests

	use test || rm test-epc.el
	default
}

src_test() {
	${EMACS} -L . -batch \
			 -L ${SITELISP}/deferred \
			 -L ${SITELISP}/concurrent \
			 -l test-epc \
			 -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."
}

src_install() {
	use test && rm test-epc.el && rm test-epc.elc
	elisp_src_install
}
