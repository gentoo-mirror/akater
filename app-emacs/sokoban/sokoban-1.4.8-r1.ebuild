# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
ELPA_CONTAINER_KIND="tar"

inherit elpa

DESCRIPTION="Implementation of Sokoban for Emacs"

SLOT="0"
KEYWORDS="amd64 x86"

ELISP_REMOVE="sokoban-pkg.el"
SITEFILE="50${PN}-gentoo.el"
DOCS="ChangeLog"

src_install() {
	elisp_src_install
	insinto "${SITEETC}/${PN}"
	doins sokoban.levels
}
