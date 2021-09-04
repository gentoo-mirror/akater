# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Common Lisp ANSI standard (draft)"
HOMEPAGE="https://gitlab.com/akater/ansicl"
# I need to add attributions

SRC_URI="
	info? ( https://gitlab.com/akater/dpans2texi/-/archive/${PV}/dpans2texi-${PV}.tar.bz2 -> ${PN}-dpans2texi.tar.bz2 )
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

BDEPEND="
	=app-doc/ansicl-dpANS-sources-15.17-r1
	info? ( >=sys-apps/texinfo-6.5.0
			app-editors/emacs )
	pdf? ( app-text/texlive-core )
"

# dpans2texi README requires >=sys-apps/texinfo-4.7 but 4.7 is old
# and there are encoding issues with source material
# which makes it incompatible with modern texinfo

src_prepare() {
	cd dpans2texi-${PV}
	eapply "${FILESDIR}"/dpans2texi-fix.patch
	eapply "${FILESDIR}"/info-fix.patch
	default
}

src_configure() {
	cd dpans2texi-${PV}
	econf
	# it's done after configure in the README so I abide
	cp /usr/share/ansicl-sources/* "${WORKDIR}"/dpans2texi-${PV}
	# todo: support custom ansicl-sources dir in the procedure
	# so that there's no need to copy
}

src_compile() {
	use info && emake -C dpans2texi-${PV} info

	# we'd like to build pdf from the same sources we build info

	# html doesn't build
	# use html && emake -C dpans2texi-${PV} html
	# or
	# use html && emake -C dpans2texi-${PV} html && HTML_DOCS="ansicl.html"
}

src_install() {
	use info && emake DESTDIR="${D}" -C dpans2texi-${PV} install-info

	# html doesn't build
	# use html && emake DESTDIR="${D}" -C dpans2texi-${PV} install-html
	# or
	# use html && dodoc
}
