# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp git-r3

DESCRIPTION="Emacs X Window Manager"
HOMEPAGE="https://github.com/ch11ng/exwm/"
EGIT_REPO_URI="https://github.com/ch11ng/${PN}.git"
EGIT_CLONE_TYPE="single+tags"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-emacs/xelb"
BDEPEND="${RDEPEND}"

DOCS=( README.md )
SITEFILE="50${PN}-gentoo.el"

src_install() {
	elisp_src_install

	insinto ${SITEETC}/${PN}/examples
	doins xinitrc
}
