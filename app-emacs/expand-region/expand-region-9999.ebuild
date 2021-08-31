# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp git-r3

DESCRIPTION="Emacs extension to increase selected region by semantic units"
HOMEPAGE="https://github.com/magnars/expand-region.el"

EGIT_REPO_URI="https://github.com/magnars/${PN}.el.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single+tags"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"

src_prepare() {
	rm expand-region-pkg.el
	default
}
