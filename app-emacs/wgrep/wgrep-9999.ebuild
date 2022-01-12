# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Writable grep buffer and apply the changes to files"
HOMEPAGE="https://github.com/mhayashi1120/Emacs-wgrep/raw/master/wgrep.el"

EGIT_REPO_URI="https://github.com/mhayashi1120/Emacs-wgrep.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"
DOCS="README.md"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
		test? ( app-emacs/ag )
"

src_prepare() {
	default
	use test || rm *test.el*
}

src_test() {
	${EMACS} ${EMACSFLAGS} -L . \
			 -l wgrep.el -l wgrep-test.elc \
			 -f ert-run-tests-batch-and-exit \
		|| die "(wgrep.el) ERT tests failed."

	${EMACS} ${EMACSFLAGS} -L . \
			 -l wgrep.elc -l wgrep-test.elc \
			 -f ert-run-tests-batch-and-exit \
		|| die "(wgrep.elc) ERT tests failed."

}

src_install() {
	rm *test.el*
	elisp_src_install
}
