# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS=24

inherit elisp

DESCRIPTION="company-mode completion backend for EBDB in message-mode"
HOMEPAGE="https://elpa.gnu.org/packages/company-ebdb.html"

SRC_URI="https://elpa.gnu.org/packages/company-ebdb-${PV}.el"
RESTRICT="mirror"
KEYWORDS="amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"

BDEPEND=">=app-editors/emacs-24"
RDEPEND=">=app-editors/emacs-24
	>=app-emacs/company-0.9.4
	>=app-emacs/ebdb-0.2
"

src_unpack() {
	mkdir "${WORKDIR}/${P}"
	cp "${DISTDIR}/${A}" "${WORKDIR}/${P}"
}

src_prepare() {
	mv "${WORKDIR}/${P}/${P}.el" "${WORKDIR}/${P}/${PN}.el"

	elisp_src_prepare
	eapply_user
}
