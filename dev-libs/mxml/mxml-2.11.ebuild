# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

SRC_URI="https://github.com/michaelrsweet/mxml/releases/download/v2.11/mxml-${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="Tiny XML library"
HOMEPAGE="http://michaelrsweet.github.io/mxml"

LICENSE="LGPL-2"
SLOT="0"
IUSE=""

DEPEND=""

S="${WORKDIR}"

src_install() {
	make DSTROOT="${D}" install
}
