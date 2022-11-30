# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=24
MY_P="emacs-${P}"

inherit elisp

DESCRIPTION="Window layout manager"
HOMEPAGE="https://github.com/kiwanami/emacs-window-layout"

SRC_URI="https://github.com/akater/${MY_P}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

KEYWORDS="amd64 x86"

LICENSE="GPL-3"
SLOT="0"

S="${WORKDIR}/${MY_P}"

DOCS="readme.md"

SITEFILE="50window-layout-gentoo.el"
