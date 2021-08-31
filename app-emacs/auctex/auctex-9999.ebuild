# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
NEED_EMACS="24.3"

inherit elisp autotools git-r3

DESCRIPTION="Extensible package for writing and formatting TeX files in Emacs"
HOMEPAGE="https://www.gnu.org/software/auctex/"

EGIT_REPO_URI="https://git.savannah.gnu.org/git/emacs/elpa.git"
EGIT_BRANCH="externals/${PN}"
EGIT_CLONE_TYPE="single"

KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3+ FDL-1.3+"
SLOT="0"
IUSE="preview-latex tex"

ELISP_TEXINFO="doc/auctex.texi"

BDEPEND="
	dev-lang/perl
	tex? ( virtual/latex-base )
	preview-latex? ( app-text/dvipng
					 app-text/ghostscript-gpl
					 )"
RDEPEND="
	tex? ( virtual/latex-base )
	preview-latex? ( app-text/dvipng
					 app-text/ghostscript-gpl
					 )"

TEXMF="/usr/share/texmf-site"

src_configure() {
	eautoreconf \
		--with-emacs \
		--with-auto-dir="${EPREFIX}/var/lib/auctex" \
		--with-lispdir="${EPREFIX}${SITELISP}/${PN}" \
		--with-packagelispdir="${EPREFIX}${SITELISP}/${PN}" \
		--with-packagedatadir="${EPREFIX}${SITEETC}/${PN}" \
		--with-texmf-dir="${EPREFIX}${TEXMF}" \
		--disable-build-dir-test \
		$(use_enable preview-latex preview)
}

src_compile() {
	export VARTEXFONTS="${T}"/fonts
	emake auctex.info preview-latex.info \
		  README			\
		  tex-site.el       \
		  doc/version.texi doc/preview-dtxdoc.texi

	use tex && emake latex/preview.dtx latex/bootstrap.ins

	elisp_src_compile
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
}

pkg_postinst() {
	use preview-latex && texmf-update
	elisp-site-regen
}

pkg_postrm() {
	use preview-latex && texmf-update
	elisp-site-regen
}
