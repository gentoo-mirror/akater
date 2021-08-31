# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

MY_PN="emacs-${PN}"
inherit elisp git-r3

DESCRIPTION="Behavior-Driven Emacs Lisp Testing"
HOMEPAGE="https://github.com/jorgenschaefer/emacs-buttercup"

EGIT_REPO_URI="https://github.com/jorgenschaefer/${MY_PN}.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
DOCS="README.md"

src_prepare() {
	rm "${PN}-pkg.el"
	sed -r \
		-e 's/docs\/writing-tests.md/docs\/writing-tests.md.bz2/' \
		-e 's/docs\/running-tests.md/docs\/running-tests.md.bz2/' \
		-i README.md || die
	default
}

src_test() {
	emake test-buttercup
	emake test-docs
}

src_install() {
	elisp_src_install

	dodoc -r docs

	dobin bin/buttercup
}
