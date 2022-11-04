# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp git-r3

DESCRIPTION="Minuscule client libraries for Git forge APIs."
HOMEPAGE="https://github.com/magit/ghub"

EGIT_REPO_URI="https://github.com/magit/ghub.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

S="${WORKDIR}/${P}/lisp"
SITEFILE="50${PN}-gentoo.el"
ELISP_TEXINFO="../docs/*.texi"
DOCS="../README.org"

BDEPEND="
	sys-apps/texinfo
"
RDEPEND="
	>=app-emacs/treepy-0.1.1
"

src_prepare() {
	rm ${PN}-pkg.el
	default
}
