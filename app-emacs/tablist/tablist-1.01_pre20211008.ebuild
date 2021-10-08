# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp

DESCRIPTION="Extended tabulated-list-mode"
HOMEPAGE="https://github.com/politza/tablist"

SRC_URI="https://github.com/akater/tablist/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3+"
SLOT="0"
SITEFILE="50${PN}-gentoo.el"
DOCS="README.md"
