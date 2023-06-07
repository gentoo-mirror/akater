# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="Sections for read-only buffers"
HOMEPAGE="https://magit.vc/"

EGIT_REPO_URI="https://github.com/magit/magit.git"
EGIT_BRANCH="main"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

SITEFILE="50${PN}-gentoo.el"
ELISP_TEXINFO="docs/magit-section.texi"

BDEPEND="
	>=app-emacs/compat-28.1.1.2
	>=app-emacs/dash-2.19.1
	sys-apps/texinfo
"
RDEPEND="${BDEPEND}
"

src_prepare() {
	default

	cp lisp/magit-section.el .

}
