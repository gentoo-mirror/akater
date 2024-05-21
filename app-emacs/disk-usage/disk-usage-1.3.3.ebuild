# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="26"
ELPA_CONTAINER_KIND="tar"

inherit elpa

DESCRIPTION="Sort and browse disk usage listings"

KEYWORDS="amd64 ~x86"

SLOT="0"

DOCS="readme.org ${PN}.png ${PN}-by-types.png"

RDEPEND="
		sys-apps/coreutils
"

MY_SITEFILE="50${PN}-gentoo.el"

src_compile() {
	elisp_src_compile
	elisp-make-autoload-file ${MY_SITEFILE}
	sed -i '/^;/d' ${MY_SITEFILE}
	sed -i '/^\f/ { N; d }' ${MY_SITEFILE}
	sed -i "1s/^/(add-to-list 'load-path \"@SITELISP@\")/" ${MY_SITEFILE}
}

src_install() {
	elisp_src_install
	elisp-site-file-install ${MY_SITEFILE}
}
