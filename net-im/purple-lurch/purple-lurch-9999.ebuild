# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Plugin for libpurple implementing OMEMO"
HOMEPAGE="https://github.com/gkdr/lurch"

EGIT_REPO_URI="https://github.com/gkdr/lurch.git"
EGIT_BRANCH="dev"
# author suggested to git submodule update --init --recursive
# but works without it so far
# apparently, portage fetches everything properly
KEYWORDS=""

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	net-im/pidgin
	dev-libs/mxml
	dev-libs/libxml2
	dev-db/sqlite
	dev-libs/libgcrypt:0
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}"

src_compile(){
	emake
}

src_install(){
	emake DESTDIR="${D}" install || die
}
