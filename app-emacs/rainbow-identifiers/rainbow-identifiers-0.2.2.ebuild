# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24"

inherit elisp

DESCRIPTION="Highlight identifiers according to their names"
HOMEPAGE="https://github.com/Fanael/rainbow-identifiers"

SRC_URI="https://github.com/Fanael/rainbow-identifiers/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~arm arm64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"
