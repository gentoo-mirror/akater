# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
EGIT_REPO_URI="https://github.com/michaelrsweet/mxml.git"

DESCRIPTION="Tiny XML library"
HOMEPAGE="http://michaelrsweet.github.io/mxml"

LICENSE="LGPL-2"
SLOT="0"
IUSE=""

DEPEND=""

src_install() {
	make DSTROOT="${D}" install
}
