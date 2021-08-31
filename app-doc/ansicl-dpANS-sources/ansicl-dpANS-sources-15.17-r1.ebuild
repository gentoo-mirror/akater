# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Common Lisp ANSI standard (draft): TeX sources"
HOMEPAGE="https://www.ansi.org"
# I couldn't find anything better

# For completeness:
	# https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/dpans1.tgz -> ${PN}-dpANS1.tgz
	# https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/dpans2.tgz -> ${PN}-dpANS2.tgz
	# https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/readme.txt -> ${PN}-readme.txt

SRC_URI="
	https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/dpans3.tgz -> ansicl-dpANS3.tgz
	https://www.cs.cmu.edu/afs/cs/Web/Groups/AI/lang/lisp/doc/standard/ansi/dpans/dpans3r.tgz -> ansicl-dpANS3R.tgz
"

RESTRICT="mirror"
S="${WORKDIR}/dpANS3"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 ppc sparc x86"
DOCS=( "README" )
# DOCS=( "README" "Verification-Notes.text" )
# Verification-notes not deleted below, wtf
IUSE="keep-dvi"

src_prepare() {

	# .dvi.Z files aren't actually needed
	if ! use keep-dvi ; then
		rm "${WORKDIR}"/dpANS3/*.dvi.Z
		rm "${WORKDIR}"/dpANS3R/*.dvi.Z
	fi

	# dpANS3R is a revision so we overwrite with it
	cp "${WORKDIR}"/dpANS3R/* "${S}"

	eapply "${FILESDIR}/ansicl-dpANS3-dict-flow-typo.patch"

	default
}

src_install() {
	default
	rm "${DOCS}"
	# Verification-notes not deleted, wtf

	# todo: symlynk doc/Reviewer-Notes -> insinto/Reviewer-Notes.text
	insinto /usr/share/ansicl-sources
	doins "${S}"/*
}
