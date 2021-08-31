# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="23"

inherit elisp

MY_PN="${PN}.el"
DESCRIPTION="Growl Notification Protocol for Emacs"
HOMEPAGE="https://github.com/tekai/gntp.el"

SRC_URI="https://github.com/tekai/gntp.el/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"
KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"
