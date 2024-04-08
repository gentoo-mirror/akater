# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="27"

ELPA_CONTAINER_KIND=tar
inherit elpa

DESCRIPTION="Vertical interactive completion"

SLOT="0"
KEYWORDS="amd64 ~x86"

RDEPEND=">=app-emacs/compat-29.1.4.4"

DOCS=( CHANGELOG.org README.org )
SITEFILE="50${PN}-gentoo.el"

src_prepare() {
	default
	rm ${PN}-pkg.el
}

src_install() {
	elisp_src_install
	doinfo ${PN}.info
}
