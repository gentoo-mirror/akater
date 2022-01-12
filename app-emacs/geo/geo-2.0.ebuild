# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

MY_PN="elisp-${PN}-mirror"
MY_P="${MY_PN}-${PV}"
inherit autotools

DESCRIPTION="Geolocation library for Emacs"
HOMEPAGE="https://git.sr.ht/~oldosfan/geo-xdg.el"

SRC_URI="https://gitlab.com/akater/${MY_PN}/-/archive/${PV}/${MY_P}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~arm ~arm64 ~x86"

LICENSE="GPL-3"
SLOT="0"
DOCS=( "NEWS" "manual.org" )

PATCHES="${FILESDIR}/${P}-include-bdeps.patch"

S="${WORKDIR}/${MY_P}"

BDEPEND="
	app-emacs/async
"
RDEPEND=">=app-editors/emacs-24[dbus]
		app-emacs/async
		net-misc/networkmanager
"

src_configure() {
	eautoreconf
	econf
}

src_compile() {
	emake all
}
