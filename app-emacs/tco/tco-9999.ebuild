# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Tail-call optimisation for Emacs Lisp"
HOMEPAGE="https://github.com/Wilfred/tco.el"

EGIT_REPO_URI="https://github.com/Wilfred/tco.el.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

DOCS="README.md"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	!=app-editors/emacs-24.3.1
	test? ( >=app-emacs/dash-1.2.0 )
"
RDEPEND=">=app-emacs/dash-1.2.0"

pkg_setup() {
	[[ "24.3.1" == $(elisp-emacs-version) ]] && \
	die "Due to a bug in cl-letf in Emacs 24.3.1, this package will not work on Emacs 24.3.1."

	elisp_pkg_setup
}

src_test() {
	${EMACS} -Q -batch              \
			 -L "${SITELISP}/dash"  \
			 -L .                   \
			 -f batch-byte-compile "test/${PN}-test.el"

	${EMACS} -Q -batch				\
			 -L "${SITELISP}/dash"  \
			 -L .					\
			 -L test				\
			 -l "${PN}-test.elc"	\
			 -f ert-run-tests-batch-and-exit || die "ERT test(s) failed."
}
