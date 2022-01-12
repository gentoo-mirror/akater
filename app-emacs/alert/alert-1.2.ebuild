# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="22"

inherit elisp

DESCRIPTION="Growl-style notification system for Emacs"
HOMEPAGE="https://github.com/jwiegley/alert"

SRC_URI="https://github.com/jwiegley/alert/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~arm ~arm64 x86"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	>=app-emacs/gntp-0.1
	>=app-emacs/log4e-0.3.0
"

SITEFILE="50${PN}-gentoo.el"
