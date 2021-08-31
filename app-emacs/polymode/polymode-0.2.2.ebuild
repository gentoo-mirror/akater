# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25"

inherit elisp

DESCRIPTION="Extensible framework for multiple GNU Emacs major modes"
HOMEPAGE="https://github.com/polymode/polymode"
SRC_URI="https://github.com/polymode/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

KEYWORDS="amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"

DOCS="docs/img docs/*.md"
