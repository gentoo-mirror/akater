# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"
ELPA_CONTAINER_KIND="tar"

inherit elpa

DESCRIPTION="Extensible package for writing and formatting TeX files in Emacs"
HOMEPAGE="https://www.gnu.org/software/auctex/"

LICENSE+=" FDL-1.3+"
SLOT="0"
KEYWORDS="amd64 arm ppc ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~sparc-solaris"
IUSE="preview-latex tex"

ELISP_TEXINFO="doc/auctex.texi"

RDEPEND="tex? ( virtual/latex-base )
	preview-latex? (
		app-text/dvipng
		app-text/ghostscript-gpl
	)"
BDEPEND="${RDEPEND}"

TEXMF="/usr/share/texmf-site"

src_prepare() {
	default
	cp "${FILESDIR}/version.texi" doc
}

src_install() {
	# emake -j1 DESTDIR="${D}" install
	# ./install-sh
	# emake DESTDIR="${D}" install
	# none of the above works so I don't know how to install tex files
	elisp_src_install
	elisp-site-file-install "${FILESDIR}/50${PN}-gentoo.el"
	if use preview-latex; then
		elisp-site-file-install "${FILESDIR}/60${PN}-gentoo.el"
	fi
	dodoc ChangeLog* README RELEASE
	# todo: if use tex install contents of ./latex/ somewhere
	# also, what's with ./style/ ?
}

pkg_postinst() {
	use preview-latex && texmf-update
	elisp-site-regen
}

pkg_postrm() {
	use preview-latex && texmf-update
	elisp-site-regen
}
