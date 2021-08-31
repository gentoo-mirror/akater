# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Common Lisp ANSI standard (draft)"
HOMEPAGE="https://www.ansi.org"
# I couldn't find anything better
# HOMEPAGE="https://gitlab.com/akater/ansicl.git"
# # I need to add attributions

# For completeness:
	# https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/dpans1.tgz -> ${PN}-dpANS1.tgz
	# https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/dpans2.tgz -> ${PN}-dpANS2.tgz
	# https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/readme.txt -> ${PN}-readme.txt

# .dvi.Z files aren't actually needed
# afaik dpANS is in public domain;
# if yes, I need to create a repo based on clstandard_build and dpans2texi without .dvi.Z and other garbage

SRC_URI="
	https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/dpans3.tgz -> ${PN}-dpANS3.tgz
	https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/dpans3r.tgz -> ${PN}-dpANS3R.tgz
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

BDEPEND="
	info? ( >=sys-apps/texinfo-6.5.0
			app-editors/emacs )
	pdf? ( app-text/texlive-core )
"
# BDEPEND="
# 	html? ( >=sys-apps/texinfo-6.5.0 )
# 	info? ( >=sys-apps/texinfo-6.5.0 )
# 	pdf? ( app-text/texlive-core )
# "

# dpans2texi README requires >=sys-apps/texinfo-4.7 but 4.7 is old
# and there are encoding issues with source material
# which makes it incompatible with modern texinfo

src_prepare() {
	eapply "${FILESDIR}/dpANS3-dict-flow-typo.patch"
	default
}

src_configure() {
	cd dpans2texi-master
	econf
	cp "${WORKDIR}"/dpANS3/* "${WORKDIR}"/dpans2texi-master
	# dpANS3R is a revision so we overwrite
	cp "${WORKDIR}"/dpANS3R/* "${WORKDIR}"/dpans2texi-master
}

src_compile() {
	# elisp todo: get rid of require 'cl
	# elisp todo: replace delete-backward-char with delete-char

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
