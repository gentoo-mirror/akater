# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Message Carbons plugin for libpurple"
HOMEPAGE="https://github.com/gkdr/carbons"

SRC_URI="https://github.com/gkdr/carbons/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	net-im/pidgin
	dev-libs/glib
	dev-libs/libxml2
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/carbons-${PV}"
