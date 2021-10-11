# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

inherit elisp git-r3

DESCRIPTION="Polymode for markdown-mode"
HOMEPAGE="https://github.com/polymode/poly-markdown"

EGIT_REPO_URI="https://github.com/polymode/poly-markdown.git"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"
DOCS="README.md"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"

BDEPEND="
	test? ( app-emacs/yaml-mode )"
RDEPEND="
	>=app-emacs/polymode-0.2.2
	>=app-emacs/markdown-mode-2.3
"

src_compile() {
	elisp_src_compile
}

src_test() {
	# Gentoo's treatment of “test” flag seems to be braindamaged
	# so we compile tests here
	elisp-compile targets/test.el

	${EMACS} ${EMACSFLAGS} -L tests --eval "(require 'ert)" \
			 --load targets/test.elc || die "ERT test(s) failed."
}
