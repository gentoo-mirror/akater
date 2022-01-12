# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp

DESCRIPTION="Library for working with xml via esxml and sxml"
HOMEPAGE="https://github.com/tali713/esxml"

SRC_URI="https://github.com/akater/esxml/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~x86"

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
