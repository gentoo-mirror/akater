# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Common Lisp ANSI standard (draft)"
HOMEPAGE="https://gitlab.com/akater/ansicl"
# I need to add attributions

SRC_URI="
	info? ( https://github.com/kriyative/dpans2texi/archive/refs/heads/master.zip -> ${PN}-dpans2texi.zip )
	pdf? ( https://gitlab.com/vancan1ty/clstandard_build/-/archive/master/clstandard_build-master.tar.bz2 -> ${PN}-pdfbuild.tar.bz2 )
"

RESTRICT="mirror"
S="${WORKDIR}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 ppc sparc x86"
IUSE="info pdf"
# IUSE="html info pdf"
REQUIRED_USE=" || ( info pdf ) "
# REQUIRED_USE=" || ( html info pdf ) "
PATCHES=( "${FILESDIR}"/dpans2texi-fix.patch "${FILESDIR}"/info-fix.patch )

BDEPEND="
	=app-doc/ansicl-dpANS-sources-15.17-r1
	info? ( >=sys-apps/texinfo-6.5.0
			app-editors/emacs )
	pdf? ( app-text/texlive-core )
"

# dpans2texi README requires >=sys-apps/texinfo-4.7 but 4.7 is old
# and there are encoding issues with source material
# which makes it incompatible with modern texinfo

src_configure() {
	cd dpans2texi-master
	econf
	# it's done after configure in the README so I abide
	cp /usr/share/ansicl-sources/* "${WORKDIR}"/dpans2texi-master
	# todo: support custom ansicl-sources dir in the procedure
	# so that there's no need to copy
}

src_compile() {
	use info && emake -C dpans2texi-master info

	# we'd like to build pdf from the same sources we build info

	# html doesn't build
	# use html && emake -C dpans2texi-master html
	# or
	# use html && emake -C dpans2texi-master html && HTML_DOCS="ansicl.html"
}

src_install() {
	use info && emake DESTDIR="${D}" -C dpans2texi-master install-info

	# html doesn't build
	# use html && emake DESTDIR="${D}" -C dpans2texi-master install-html
	# or
	# use html && dodoc
}
