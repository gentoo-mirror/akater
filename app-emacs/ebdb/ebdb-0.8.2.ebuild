# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

ELPA_CONTAINER_KIND=tar

inherit elpa

DESCRIPTION="Contact management package"

KEYWORDS="amd64 ~x86"

SLOT="0"
IUSE="company"

ELISP_TEXINFO="ebdb.texi"
DOCS="README.org"

BDEPEND="
	sys-apps/texinfo"
RDEPEND="
	company? ( app-emacs/company-ebdb )"

src_prepare() {
	default
	rm ebdb-mhe.el
}
