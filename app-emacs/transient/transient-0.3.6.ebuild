# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="25.1"

inherit elisp

DESCRIPTION="Convenient infix arguments and suffix commands in Emacs"
HOMEPAGE="https://github.com/magit/transient"

SRC_URI="https://github.com/magit/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
KEYWORDS="amd64 ~arm ~arm64 ~x86"

LICENSE="GPL-3"
SLOT="0"

S="${WORKDIR}/${P}/lisp"
ELISP_TEXINFO="../docs/transient.texi"
DOCS="../README.md"

SITEFILE="50${PN}-gentoo.el"

BDEPEND="
	sys-apps/texinfo"
