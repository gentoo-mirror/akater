# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=24

MY_PN="${PN}.el"
inherit elisp git-r3

DESCRIPTION="An Emacs front-end for ag ('the silver searcher')"
HOMEPAGE="https://github.com/Wilfred/ag.el"

EGIT_REPO_URI="https://github.com/Wilfred/${MY_PN}.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="doc test"
DOCS="README.md"

BDEPEND="
	doc? ( dev-python/sphinx )
	test? ( app-emacs/cask )
"
RDEPEND="
	>=app-emacs/dash-2.8.0
	>=app-emacs/s-1.9.0
"

src_test() {
	emake unit
}

src_compile() {
	elisp_src_compile
	use doc && emake -C docs || die
}

src_install() {
	elisp_src_install
	use doc && dodoc -r docs
}
