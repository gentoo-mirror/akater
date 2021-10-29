# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Library for working with xml via esxml and sxml"
HOMEPAGE="https://github.com/tali713/esxml"

# EGIT_REPO_URI="https://github.com/tali713/esxml.git"
EGIT_REPO_URI="https://github.com/akater/esxml.git"
EGIT_BRANCH="fix-build"
EGIT_CLONE_TYPE="single+tags"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

IUSE="test"

DOCS="README.org"

BDEPEND="
	test? ( app-emacs/db
			app-emacs/uuid )
"
RDEPEND="
	>=app-emacs/kv-0.0.5
"

SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	rm "${PN}-pkg.el"
	# The following two are not listed in the recipe
	rm "css-lite.el"
	rm "esxpath.el"
	use test || rm "${PN}-form-tests.el"
	use test || rm "${PN}-query-tests.el"
	default
}

src_install() {
	use test && rm "${PN}-form-tests.el"
	use test && rm "${PN}-form-tests.elc"
	use test && rm "${PN}-query-tests.el"
	use test && rm "${PN}-query-tests.elc"
	elisp_src_install
}
