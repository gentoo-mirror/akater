# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=22

inherit elisp git-r3

DESCRIPTION="Automatic insertion, wrapping and paredit-like navigation w/ user defined pairs."
HOMEPAGE="https://github.com/Fuco1/smartparens"

EGIT_REPO_URI="https://github.com/Fuco1/smartparens.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND=">=app-emacs/dash-2.13.0"
SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	rm ${PN}-pkg.el
	default
}
