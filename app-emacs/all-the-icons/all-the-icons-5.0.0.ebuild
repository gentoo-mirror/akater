# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp

MY_PN="${PN}.el"
DESCRIPTION="A library for inserting Developer icons"
HOMEPAGE="https://github.com/domtronn/all-the-icons.el"

SRC_URI="https://github.com/domtronn/all-the-icons.el/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
S="${WORKDIR}/${MY_PN}-${PV}"
KEYWORDS="amd64 ~arm ~arm64 ~x86"

LICENSE="GPL-3"
SLOT="0"

SITEFILE="50${PN}-gentoo.el"

src_install() {
	elisp_src_install

	elisp-install ${PN} -r data
}
