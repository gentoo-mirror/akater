# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.4"

inherit elisp git-r3

DESCRIPTION="Display available keybindings in popup"
HOMEPAGE="https://github.com/justbur/emacs-which-key"

EGIT_REPO_URI="https://github.com/justbur/emacs-which-key.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="test"
DOCS="README.org"

src_prepare() {
	use test || rm *-tests.el*

	default
}

src_test() {
	${EMACS} -q -batch -L . \
			 -l which-key-tests -f ert-run-tests-batch-and-exit \
		&& rm *-tests.el*
}

src_install() {
	elisp_src_install
	elisp-install ${PN} -r img
}