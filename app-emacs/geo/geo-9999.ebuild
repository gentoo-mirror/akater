# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit autotools git-r3

DESCRIPTION="Geolocation library for Emacs"
HOMEPAGE="https://git.sr.ht/~oldosfan/geo-xdg.el"

EGIT_REPO_URI="https://git.sr.ht/~oldosfan/geo-xdg.el"
EGIT_CLONE_TYPE="single+tags"
EGIT_BRANCH="master"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
DOCS=( "NEWS" "manual.org" )

# PATCHES="${FILESDIR}/${PN}-2.0-verbose-elc-build.patch"
PATCHES="${FILESDIR}/${PN}-2.0-include-bdeps.patch"
# PATCHES="${FILESDIR}/${PN}-2.0-verbose-elc-build.patch
# 	${FILESDIR}/${PN}-2.0-include-bdeps.patch"

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
