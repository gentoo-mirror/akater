# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp git-r3

DESCRIPTION="Support library for PDF documents"
HOMEPAGE="https://github.com/vedang/pdf-tools/"

EGIT_REPO_URI="https://github.com/vedang/pdf-tools.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

IUSE="test"

BDEPEND="
	app-editors/emacs[gui]
	>=app-emacs/tablist-1.0
	test? ( app-emacs/cask dev-libs/glib )
"
RDEPEND="
	app-editors/emacs[gui]
	>=app-emacs/tablist-1.0
	dev-libs/glib
"

SITEFILE="50${PN}-gentoo.el"
DOCS="NEWS README.org"

src_compile() {
	BYTECOMPFLAGS="-L lisp"
	elisp-compile lisp/*.el
	emake server/epdfinfo
}

src_test() {
	make check
}
